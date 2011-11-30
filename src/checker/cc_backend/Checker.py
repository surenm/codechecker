#!/usr/bin
import sys
import os
import string
import time
import threading
import logging
import zmq
import json

from store.default_store import Default
from evaluator.eval import Evaluate
from compiler.compile import Compiler
from score.score import Score
from Config import Config

logger = logging.getLogger('main')
handler = logging.FileHandler('/tmp/run.log')
logger.addHandler(handler)
logger.setLevel(logging.DEBUG)

def wait_for_submission(store):
    """
    Returns a submission to be evaluated. Blocks execution until one
    is available.
    """
    is_waiting = False
    while True:
        submission = store.get_submission()
        if submission is not None:
            yield submission
        else:
            if not is_waiting:
                is_waiting = True
                print "Waiting for a submission."
            time.sleep(2)


def compile_submission(compiler, store, submission):
    """
    Attempts to compile the submission. Updates the status in the
    store. Return True or False.
    """
    compiler_result = compiler.compile_source(submission['source_file'])
    if not compiler_result:
        return None
        
    if compiler_result["retcode"] == 0:
        store.set_compile_status("CMPS", submission_id=submission["id"])
        return compiler_result
    else:
        store.set_compile_status("CMPE", err_msg=compiler_result['compiler_output'], submission_id=submission["id"])
        return None


def main():
    config = Config("/usr/local/etc/checker/codechecker.conf")
    store = Default(config)
    compiler = Compiler(config)
    evaluator = Evaluate(config)

    context = zmq.Context()
    socket = context.socket(zmq.REP)
    socket.bind('tcp://*:5555')
    while True:
        try: 
            request_object = socket.recv()
            request = json.loads(request_object)
            new_submission = store.set_submission(request)
            submission = store.get_submission_by_id(new_submission.id)
            
            compiler_result = compile_submission(compiler, store, submission)
            if compiler_result == None:
                continue

            # Evaluate the queued submission. Somewhere in the following
            # loop it is also possible that the program fails - need to
            # set the status to runtime error status.
            for testset in store.get_all_testsets(submission["problem"]):
                testset_info = testset
                testset_info["inputs"] = []
                testset_info["reference_outputs"] = []
                for testcase in store.get_all_testcases(testset["id"]):
                    testset_info["inputs"].append(testcase["input"])
                    testset_info["reference_outputs"].append(testcase["reference_output"])

                result_set = evaluator.eval_submission(submission, testset_info, compiler_result["run_command"])
        
            socket.send("Hello world")
            
        except Exception as e:
            print e
            socket.send("error")


def CheckerInfiniteLoop():
    config = Config("/usr/local/etc/checker/codechecker.conf")
    store = Default(config)
    compiler = Compiler(config)
    evaluator = Evaluate(config)
    score = Score()

    # Each iteration of the loop below evalutes a submission.
    for submission in wait_for_submission(store):
        logger.info("Starting to process submission %s" % str(submission['id']))
        # compile the submission
    
        compiler_result = compile_submission(compiler, store, submission)
        if compiler_result == None:
            continue

        # Evaluate the queued submission. Somewhere in the following
        # loop it is also possible that the program fails - need to
        # set the status to runtime error status.
        test_group_scores = []
        for testset in store.get_all_testsets(submission["problem"]):
            testset_info = testset
            testset_info["inputs"] = []
            testset_info["reference_outputs"] = []
            for testcase in store.get_all_testcases(testset["id"]):
                testset_info["inputs"].append(testcase["input"])
                testset_info["reference_outputs"].append(testcase["reference_output"])
           
            result_set = evaluator.eval_submission(submission, testset_info, compiler_result["run_command"])
        
            #TODO: implement the below functions properly.
            #test_grp_score = score.score_group(prob_id, result_set)
            #store.set_test_group_score(test_grp_score, problem_id=prob_id, test_group_id=test_grp["id"], submission_id=submission["id"])
            #test_group_scores.append(test_grp_score)

        # compute and set the overall score.
        #final_score = score.overall(test_group_scores, problem_id=prob_id)
        #store.set_submission_score(final_score, submission_id=submission["id"])
        #store.set_submission_run_status("PASS", submission_id=submission["id"])
        logger.info("Completed submission %s" % str(submission["id"]))

if __name__ == '__main__':
    main()

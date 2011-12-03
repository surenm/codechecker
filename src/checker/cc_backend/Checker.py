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
handler = logging.StreamHandler()
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
    print "Starting Checker"
    config = Config("/usr/local/etc/checker/codechecker.conf")
    store = Default(config)
    compiler = Compiler(config)
    evaluator = Evaluate(config)

    context = zmq.Context()
    socket = context.socket(zmq.REP)
    socket.bind('tcp://*:5555')
    print "Bound to ZMQ socket"
    while True:
        try: 
            response = {}
            request_object = socket.recv()
            print "Request is %s" % request_object
            request = json.loads(request_object)
            new_submission = store.set_submission(request)
            submission = store.get_submission_by_id(new_submission.id)
            
            
            compiler_result = compile_submission(compiler, store, submission)
            response['compiler_output'] = compiler_result['compiler_output']
            
            if compiler_result == None:
                response['compile_status'] = False

                print "Compile failed - %s" % str(response)
                socket.send(json.dumps(response))
                continue
            
            # if we have come here, then we have passed compilation
            response['compile_status'] = True
            response['outputs'] = []
            for testset in store.get_all_testsets(submission["problem"]):
                testset_info = testset
                testset_info["inputs"] = []
                testset_info["reference_outputs"] = []
                for testcase in store.get_all_testcases(testset["id"]):
                    testset_info["inputs"].append(testcase["input"])
                    testset_info["reference_outputs"].append(testcase["reference_output"])

                results = evaluator.eval_submission(submission, testset_info, compiler_result["run_command"])

                for result in results:
                    response['outputs'].append((result['input'], result['output']))

            socket.send(json.dumps(response))

        except Exception as e:
            print e, type(e)
            response['error_type'] = type(e)
            response['error'] = e
            socket.send("Error processing submission.")

        logger.info("Completed processing %s" % str(submission["id"]))

if __name__ == '__main__':
    main()

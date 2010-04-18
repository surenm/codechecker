import os
import sys
import time
import string

from codechecker.contests.models import Submission,Problem,TestCase,Contest
import SimpleChecker
from codechecker.Logger import log
#import MultipleChecker
#import ComplexChecker

RUNS_PATH = '/opt/checker/codechecker/backend/submissions/'

def handle_simple_checker(submission):
    tests = TestCase.objects.filter(problem=submission.problem)
    
    # set submission status to running
    submission.result = "RUN"
    submission.save()

    for test in tests:
        print str(test.pk)       
        SimpleChecker.run(submission, test)
        #reload the submission data from the db
        submission = Submission.objects.get(id = submission.id)
        if submission.result != 'RUN':
            break
        
    if submission.result == "RUN":
        submission.result = "ACC"

        # set points for the submission
        submission.submissionPoints = Problem.objects.get(id = submission.problem_id
                                                          ).maxScore        
        # set the penalty for the submission
        contestid = Problem.objects.get(id = submission.problem_id).contest_id
        contest = Contest.objects.get(id = contestid)
        tdelta = submission.submissionTime - contest.startDateTime
        minutes = tdelta.days*24*60 + tdelta.seconds/60
        submission.submissionPenalty = minutes
    else:
        #set the points and penalty for the submission
        submission.submissionPoints = 0
        submission.submissionPenalty = 20

    submission.save()
        
# The 'submission' argument is a model-instance (not a dictionary).
def handle_submission( submission ):

    #write the submission code to a file.
    submission.write_code_to_disk()

    # compile the submission
    compiler_out = submission.compile()

    # check the compile result.
    if not(submission.check_compile_result()):
        log(compiler_out)
        log("Compilation failure #%s\n" % str(submission.pk))
        #set the points and penalty for the submission
        submission.submissionPoints = 0
        submission.submissionPenalty = 20
        submission.save()
        return

    # Compilation is successful. So proceeding.
       
    compiler_out += "Compilation Successful\n"
    log("Compilation Successful for submission #%s" % str(submission.pk))

    # Run the submission's generated executable.
    #prob = Problem.objects.get(id=submission.problem.id)

    handle_simple_checker(submission)

        
#    if prob.ptype == 'Simple':
#    elif prob.ptype == 'Multiple' :
#        MultipleChecker.run(submission)
#    elif prob.ptype == 'Complex' :
#        ComplexChecker.run(submission)

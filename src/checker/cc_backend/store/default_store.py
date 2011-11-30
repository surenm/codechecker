import os
from checker.cc_frontend.web.models import Contest, Problem, Submission, TestSet, Testcase, User
from storage_interface import Store

class Default(Store):

    """
    TODO: Implement the storage inferface for Django. See the API
    specification in storage_interface.py for details about how to
    implement the stubs below.
    """

    def __init__(self, config):
        self.config = config

    def __init_submission__(self, submission):
        # create a directory for this submission
        base_directory = os.path.join(self.config.abs_path, str(submission.id))
        src_fname = os.path.join(base_directory, 'solution.' + str(submission.language))

        if not os.path.exists(base_directory):
            os.mkdir(base_directory)
            
        if not os.path.exists(src_fname):
            src_file = open(src_fname, 'w')
            src_file.write(submission.code)
            src_file.close()
        
        return src_fname
        
    def set_submission(self, request):
        submission = Submission()
        submission.user = User.objects.get(id=2)
        problem = Problem.objects.get(id=1)
        submission.problem = problem
        submission.language = request['language']
        submission.code = request['code']
        submission.errors = ''
        submission.save()
        return submission
    
    def get_submission_by_id(self, _id):
        submission = Submission.objects.get(id=_id)
        source_file = self.__init_submission__(submission)
        
        ret = {}
        ret['source_file'] = source_file
        ret['id'] = submission.pk
        ret['problem'] = int(submission.problem.pk)
        ret['language'] = str(submission.language)
        
        return ret
        
        
    def get_submission(self):
        try:
            latest_submission = Submission.objects.filter(result='QU')[0]
            source_file = self.__init_submission__(latest_submission)

            ret = {}
            ret['source_file'] = source_file
            ret['id'] = latest_submission.pk
            ret['problem'] = int(latest_submission.problem.pk)
            ret['language'] = str(latest_submission.language)
            
            return ret

        except IndexError:
            print "No queued submission found"
            return None

    def set_compile_status(self, status, err_msg="", submission_id=None):
        q_sub = Submission.objects.get(id=int(submission_id))
        q_sub.result = status
        q_sub.errors = err_msg
        q_sub.save()

    def get_all_testsets(self, problem_id=None):
        testsets = TestSet.objects.filter(problem=int(problem_id))
        for testset in testsets:
            return_testset = {}
            return_testset['id'] = testset.pk
            return_testset['problem'] = problem_id
            return_testset['time_limit'] = testset.tlimit
            return_testset['memory_limit'] = testset.mlimit
            return_testset['score'] = testset.score
            return_testset['is_cust_scored'] = testset.is_cust_scored
            return_testset['cust_execute'] = testset.cust_executable
            yield return_testset

    def get_all_testcases(self, testset_id):
        testcases = Testcase.objects.filter(testSet=testset_id)
        for testcase in testcases:
            ret_tc = {}
            ret_tc['input'] = testcase.input
            ret_tc['reference_output'] = testcase.output
            ret_tc['id'] = str(testcase.pk)
            yield ret_tc

    def set_testset_score(self, score, problem_id=None, test_set_id=None, submission_id=None):
        testset = TestSet.objects.filter(pk=test_set_id)
        testset.score = score
        testset.save()

    def set_submission_run_status(self, status, submission_id=None):
        q_sub = Submission.objects.filter(pk=int(submission_id))
        q_sub.result = status
        q_sub.save()

    def set_submission_score(self, score, submission_id=None):
        q_sub = Submission.objects.filter(pk=int(submission_id))
        q_sub.score = score
        q_sub.save()

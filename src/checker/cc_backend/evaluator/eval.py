import os
import stat
import subprocess
import checker.cc_backend.se.secexec as secexec

class Evaluate:
    def __init__(self, config):
        self.config = config
        self.reference_outputs_base = self.config.reference_outputs_path
        
    def _set_submission_inputs(self, submission, test_set):
        for (index, input_file_content) in enumerate(test_set["inputs"]):
            input_file = os.path.join(self.config.abs_path, str(submission["id"]), str(index)) + '.in'
            input_fp = open(input_file, 'w')
            input_fp.write(input_file_content)
            input_fp.close()  
    
    def _set_submission_references(self, submission, test_set):
        submission_reference_base = os.path.join(self.reference_outputs_base, str(submission["id"]))
        if not os.path.exists(submission_reference_base):
            os.mkdir(submission_reference_base)

        for (index, reference_file_content) in enumerate(test_set['reference_outputs']):
            reference_file = os.path.join(submission_reference_base, str(index) + '.ref')
            reference_fp = open(reference_file, 'w')
            reference_fp.write(reference_file_content)
            reference_fp.close()
    
    def _get_run_cmd(self, submission, exec_string):
        executable = os.path.join(self.config.abs_path, str(submission['id']), 'solution.exe')
        return exec_string.replace("%e", executable)

    def eval_submission(self, submission, test_set, run_template):
        """Takes submission and test_set and returns result_set"""
        
        self._set_submission_inputs(submission, test_set)
        self._set_submission_references(submission, test_set)
        run_command = self._get_run_cmd(submission, run_template)
        
        tlimit = test_set["time_limit"]
        mlimit = test_set["memory_limit"]
        max_file_size = 32

        #Assumption: each infile would be of the form submission_id.in
        effective_user_id = 10000 + long(submission["id"]) % 10000
        for (index, input_file) in enumerate(test_set["inputs"]):
            abs_index_file_base = os.path.join(self.config.abs_path, str(submission["id"]), str(index))
            runs_index_file_base = os.path.join(self.config.run_path, str(submission["id"]), str(index))
            
            abs_input_file = abs_index_file_base + '.in'
            abs_out_file = abs_index_file_base + '.out'
            abs_error_file = abs_index_file_base + '.err'
            
            input_file = runs_index_file_base + '.in'
            out_file = runs_index_file_base + '.out'
            error_file = runs_index_file_base + '.err'

            os.system('touch %s' % abs_out_file)
            os.system('touch %s' % abs_error_file)
            
            os.system('chown %d %s' % (effective_user_id, abs_input_file))
            os.system('chown %d %s' % (effective_user_id, abs_out_file))
            os.system('chown %d %s' % (effective_user_id, abs_error_file))
            
            os.chmod(abs_input_file, stat.S_IRUSR)
            os.chmod(abs_out_file, stat.S_IRUSR | stat.S_IWUSR)
            os.chmod(abs_error_file, stat.S_IRUSR | stat.S_IWUSR)
            
            executable_file = os.path.join(self.config.abs_path, str(submission['id']), 'solution.exe')
            os.system('chown %d %s' % (effective_user_id, executable_file))
            os.chmod(executable_file, stat.S_IRUSR | stat.S_IXUSR)
            
            reference_file = os.path.join(self.reference_outputs_base, str(submission["id"]), str(index) + '.ref')
            
            args = ["--infile=%s" % input_file,
                    "--outfile=%s" % out_file,
                    "--errfile=%s" % error_file,
                    "--memlimit=%d" % mlimit,
                    "--timelimit=%d" % tlimit,
                    "--maxfilesz=%d" % max_file_size,
                    "--executable=%s" % run_command,
                    "--euid=%d" % effective_user_id, #TODO: someone needs to send the euid to use here
                    "--jailroot=%s" % self.config.jail_root]
            
            ret_code = secexec.secure_spawn(args) 

            #End of executing the submission_exec
            if test_set["is_cust_scored"] == True:
               # use the custom executable to run
               pass
            else:
                check = subprocess.Popen('diff -Bb %s %s' % (abs_out_file, reference_file), shell=True, stdout=subprocess.PIPE)
                diff_op = check.communicate()[0]
                if diff_op == '':
                    #testcase passed
                    pass
                else:
                    #testcase failed
                    pass
            pass
        pass
    pass
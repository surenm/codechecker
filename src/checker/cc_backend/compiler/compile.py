import subprocess
import os.path

class Compiler:
    def __init__(self, config):
        self.config = config

    def compile_source(self, source_filepath, lang=None):
		compiler = self.get_compiler(source_filepath, lang)
		compile_cmd = compiler.get_compile_cmd(source_filepath)
		child = subprocess.Popen(compile_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
		out, err = child.communicate()
		
		response = {}
		response["retcode"] = child.returncode
		response["compiler_output"] = out + err
		response["run_command"] = compiler.get_run_cmd(source_filepath)
		return response

    # determines the language from the extension or from the lang
    # argument if one is supplied.
    def get_compiler(self, source_filepath, language=None):
        if not language:
            language = os.path.basename(source_filepath).split('.')[-1]
            
        if language == "c":
            return C_Compiler(self.config)
        elif language == "cpp":
            return CPP_Compiler(self.config)
        elif language == "py":
            return Py_Compiler(self.config)
        elif language == "java":
            return Java_Compiler(self.config)

class C_Compiler:
    """
    This is a language specific compiler class. It needs all the
    methods needed below below.
    """
    def __init__(self, config):
        self.config = config
        self.compile_cmd = config.config.get("CompileCommands", "C_compile")
        self.exec_string = config.config.get("CompileCommands", "C_run")
        
    def _get_executable_path(self, source_path):
        base_directory = os.path.dirname(source_path)
        return os.path.join(base_directory, 'solution.exe')

    def get_compile_cmd(self, source_path):
        # source path is a complete path without considering JAIL. Because compilation happens outside JAIL 
        executable = self._get_executable_path(source_path)
        return self.compile_cmd.replace("%s", source_path).replace("%e", executable)

    def get_run_cmd(self, source_path):
        return self.exec_string

#TODO: Things were breaking here
class CPP_Compiler:
    def __init__(self, config):
        self.config = config
        self.compile_cmd = config.config.get("CompileCommands", "CPP_compile")
        self.exec_string = config.config.get("CompileCommands", "CPP_run")
        
    def _get_executable_path(self, source_path):
        base_directory = os.path.dirname(source_path)
        return os.path.join(base_directory, 'solution.exe')

    def get_compile_cmd(self, source_path):
        # source path is a complete path without considering JAIL. Because compilation happens outside JAIL 
        executable = self._get_executable_path(source_path)
        return self.compile_cmd.replace("%s", source_path).replace("%e", executable)

    def get_run_cmd(self, source_path):
        return self.exec_string

class Py_Compiler:
    pass

class Java_Compiler:
    pass

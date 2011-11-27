import subprocess
from os.path import dirname, abspath 

def secure_spawn(args):
    """
        Takes a list of arguments where arg0 is secexec (setuid helper).
        * execname is always relative to jailroot.
        * jailroot is always expressd in absolute path terms.
        Returns return code of execname that was run in jailroot
    """
    curdir = dirname(abspath(__file__))
    args.insert(0, "/usr/local/bin/secexec")
    run = subprocess.Popen(args)
    run.wait()
    return run.returncode

if __name__ == "__main__":
    infile, outfile, errfile = "in", "out", "err"
    curdir = dirname(abspath(__file__))
    jailroot =  curdir + "/jail"
    mlimit, tlimit, maxfilesz = 32, 2, 32
    #execname should be relative to jailroot
    execname = "./helloworld"
    euid = 1002
    print execname
    
    args = ["--infile=%s" % infile,
            "--outfile=%s" % outfile,
            "--errfile=%s" % errfile,
            "--memlimit=%d" % mlimit,
            "--timelimit=%d" % tlimit,
            "--maxfilesz=%d" % maxfilesz,
            "--executable=%s" % execname,
            "--euid=%d" % euid,
            "--jailroot=%s" % jailroot]
    args.insert(0, curdir + "/secexec")
    print args
    secure_spawn(args)

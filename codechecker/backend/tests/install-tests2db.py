import sys, os
import datetime
sys.path.append("/opt/checker")
from codechecker.contests.models import Submission, User, Problem

def submit_to_db(files):
  lang_dict = {'C' : 1, 'CPP' : 2}
  for fname in files:
    ext = fname.rsplit(".", 1)[1]
    sub = Submission()
    sub.user = User.objects.get(id = 1)
    sub.problem = Problem.objects.get(id = 1) 
    sub.result = "QU"
    sub.submissionTime = datetime.datetime.now() 
    sub.submissionLang = lang_dict[ext.upper()]
    sub.submissionPenalty = 0
    sub.submissionPoints = 0
    sub.submissionCode = file(fname, "r").read()
    sub.save()
      
if __name__ == "__main__":
  print sys.argv[1:]
  submit_to_db(sys.argv[1:])


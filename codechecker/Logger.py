LOG_LEVEL = 1
LOG_FILE = "/tmp/nohup.out" 

def log(message):
  if LOG_LEVEL:
    f = file(LOG_FILE, "a")
    f.write(message + "\n")
    f.close()

def get_log_level():
  return LOG_LEVEL
    

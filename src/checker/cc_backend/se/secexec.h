#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/resource.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <getopt.h>

#define MAX_PATH_LEN 300
#define MAX_ARGS 20

struct _ExecArgs {
  int timelimit, memlimit, maxfilesz,
      euid;
  char infile[MAX_PATH_LEN];
  char outfile[MAX_PATH_LEN];
  char errfile[MAX_PATH_LEN];
  char jailroot[MAX_PATH_LEN];
  char execname[MAX_PATH_LEN];
};

typedef struct _ExecArgs ExecArgs;

int secure_spawn(ExecArgs ea);

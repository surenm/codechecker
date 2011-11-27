
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Dumping data for table `contests_contest`
--

INSERT INTO `web_contest` (`id`, `title`, `description`, `startTime`, `endTime`, `public`) VALUES
(1, 'TestContest', 'Test contest', '2010-02-15 19:20:53', '2010-02-25 21:21:00', 0);


--
-- Dumping data for table `contests_submission`
--

INSERT INTO `web_submission` (`id`, `user_id`, `problem_id`, `result`, `time`, `language`, `penalty`, `score`, `code`, `errors`) VALUES
(1, 1, 1, 'WA', '2010-03-13 06:16:22', 'c', 0, 0, '#include <stdio.h>\n#include <stdlib.h>\n\nint main()\n{\n  FILE *fp = fopen("/tmp/just4fun", "a");\n  fprintf(fp, "I opened a file despite your code checker rlimits!\\n");\n  return 0;\n}\n', ''),
(2, 1, 1, 'ACC', '2010-03-13 06:16:22', 'c', 0, 100, '#include <stdio.h>\n#include <stdlib.h>\n\nint main()\n{\n  FILE *fp = fopen("ikillu", "a");\n  while(1)\n  {\n    fprintf(fp, "I kill U");\n  }\n  return 0;\n}\n\n', ''),
(3, 1, 1, 'ACC', '2010-03-13 06:16:22', 'c', 0, 100, '/* This program is supposed to break the CPU time limit */\n#include <sys/resource.h>\n#include <stdio.h>\n#include <stdlib.h>\n\nint main()\n{\n    while(1) sleep(10);\n}\n', ''),
(4, 1, 1, 'ACC', '2010-03-13 06:16:22', 'c', 0, 100, '#include <stdio.h>\n\nint main()\n{\n  while(1){\n    printf("keep printing");\n  }\n}\n\n\n\n', ''),
(5, 1, 1, 'WA', '2010-03-13 06:16:22', 'cpp', 0, 0, '#include <iostream>\n#include <unistd.h>\n#include <cstdio>\n#include <cstdlib>\n\nusing namespace std;\n\nint main () \n{\n  FILE *fp = fopen("/tmp/fork-test.out", "a");\n  pid_t p = fork();\n  if(!p) {\n    fprintf(fp, "In Child\\n");\n    return 0;\n  }\n  fprintf(fp, "In Parent\\n");\n  return 0;\n}\n', ''),
(6, 1, 1, 'ACC', '2010-03-13 06:16:22', 'cpp', 0, 100, '/* This program is intended to allocate large amounts of memory in the heap and bring down the system. */\n#include <iostream>\n#include <cstdlib>\n\nusing namespace std;\n\nconst int M = 64, N = 1 << 20;\n\nint main() \n{\n  int *heap_alloc =  (int*) malloc(sizeof(int)*(M*N+1));\n  for (int i = 0;i < M*N + 1; i++) heap_alloc[i] = i;\n\n  return 0;\n}\n           \n\n', ''),
(7, 1, 1, 'ACC', '2010-03-13 06:16:22', 'cpp', 0, 100, '/* This program is intended to DoS the code checker by running ''forever'' */\n#include <iostream>\n\nusing namespace std;\n\nint main() \n{ \n  while(1) {}\n  return 0;\n}\n', ''),
(8, 1, 1, 'ACC', '2010-03-14 13:43:04', 'c', 0, 100, '#include <stdio.h>\r\n\r\nint main() {\r\n  int n; scanf("%d", &n);\r\n  int i;\r\n  for(i=0; i<n; i++) printf("Hello World\\n");\r\n  return 0;\r\n}\r\n', ''),
(10, 1, 1, 'CMPE', '2010-03-14 15:27:22', 'py', 20, 0, 't = int(raw_input())\r\nfor i in range(0, t)\r\n  print "Hello World"', 'Compiling /opt/checker/codechecker/backend/submissions/10.py ...\nSyntaxError: (''invalid syntax'', (''/opt/checker/codechecker/backend/submissions/10.py'', 2, 21, ''for i in range(0, t)\\n''))\n\n'),
(11, 1, 1, 'WA', '2010-03-15 15:50:44', 'py', 0, 0, 't = int(raw_input)\nfor i in range(0,t):\n    print "Hello World"\n\n', ''),
(12, 1, 1, 'ACC', '2010-04-19 19:52:10', 'java', 0, 100, 'import java.io.*;\npublic class Main {\n	public static void main (String args[]) throws IOException {\n		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));\n		int n = Integer.parseInt(br.readLine());\n		for(int i=0;i<n;i++) {\n			System.out.println("Hello World");\n		}\n		return;\n	}\n}\n', ''),
(13, 1, 1, 'CMP', '2010-04-23 09:11:07', 'hs', 0, 0, 'import Data.Char \nimport Control.Monad\n\noutput n = take n (repeat "Hello World")	\nmain = do\n	n <- getLine\n	putStr $ unlines (output (read n))\n', '');

-- --------------------------------------------------------

--
-- Dumping data for table `contests_testcase`
--

INSERT INTO `web_testcase` (`id`, `testSet_id`, `input`, `output`) VALUES
(1, 1, '12\r\n', 'Hello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\n'),
(2, 1, '2\r\n', 'Hello World\r\nHello World\r\n');

-- --------------------------------------------------------

--
-- Dumping data for table `contests_testset`
--

INSERT INTO `web_testset` (`id`, `problem_id`, `score`, `tlimit`, `mlimit`) VALUES
(1, 1, 100, 2, 64);


#! /bin/bash
rm -f codechecker/backend/setuid_helper
gcc -o codechecker/backend/setuid_helper -DDBG codechecker/backend/setuid_helper.c
cd codechecker/backend
sudo chown root:root setuid_helper && sudo chmod u+s setuid_helper
cd ../../

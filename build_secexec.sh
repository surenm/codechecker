cd src/checker/cc_backend/se/
gcc -DDBG -DGETOPT -DJAIL -I. -o secexec secexec.c
#gcc -DDBG -DJAIL -I. -o secexec secexec.c
#gcc -I. -o secexec secexec.c
sudo chown root:root secexec
sudo cp secexec /usr/local/bin
sudo chmod u+s secexec
sudo chmod u+s /usr/local/bin/secexec

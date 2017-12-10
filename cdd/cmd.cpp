// cd d example
// gcc -g cmd.cpp
// g++ -lstdc++ -o cdd cmd.cpp
// && ./a.out

#include <iostream>
#include <stdio.h>
#include <cstring>
#include <memory>
//. #include <pstream>   redi::ipstream proc("./some_command", redi::pstreams::pstdout
#include <string>
#include <unistd.h> 

using namespace std;

int main( int argc, char* args[])
{
  // cout << argc;
  if (argc < 2) {
    cout << "args error: no cd parameter\n";
    cout << "usage     : $(cdd \"c:\\bin\") \n";
    return -1;
  }

  char buff[160]; char* dd;

  strcpy(buff, "/mnt/x/");
  dd = (char*)buff + 7;
  // cout << "pwd: /mnt/" << args[1] << '\n';
  strcpy(dd, args[1] + 3);
  int argLen = strlen(args[1]);
  dd[argLen - 2] = (char)0;

  int iLen = strlen(buff);
  for (int i = 0; i < iLen; i++)
  {
    if (buff[i] == '\\')
        buff[i] = '/';
  }
  buff[5] = args[1][0];

  char cmd[160];
  strcpy(cmd, "cd ");
  strcpy(cmd + 3, buff);
  cout << cmd << '\n';

  // chdir
  chdir(buff);
    
  /* char *newargv[] = { NULL }; // , "hello", "world", NULL };
  char *newenviron[] = { NULL };
  char bash[5] = "bash";
  execve(bash, newargv, newenviron);
  perror("execve");
  */
 
  return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>





void fill_argv(char *tmp_argv){
  char *foo = tmp_argv;
  int index = 0;
  char rt[100];
  bzero(ret, 100);
  while(*foo != '\0'){
    if (index == 10)
      break;
    if(*foo == '  '{
	if my_argv[index] == NULL){
	my_argv[index] = (char *)malloc(sizeof(char) * strlen(ret) + 1);
      }
      else{
	bzero(my_argv[index], strln(my_argv[index]));
      }
      strncpy(my_argv[index], et, strln(ret));
      strncat(my_argv [index], "\0", 1);
      bzero(ret, 100);
      index++;
      }
    else{
      strncat(ret, foo, 1);
    }
    foo++;
  }
  if(ret[0] != '\0'){
    my_argv[index] = (char *)malloc(sizof(char) * strlen(ret) + 1);
    strncpy(my_argv[index], rt, strlen(ret));
    strncat(my_argv[index], "\0", 1);
  }
} 



int attach_path(char *cmd){
  char ret[100];
  int index;
  int fd;
  bzero(ret, 100);
  for(index = 0; search_path[index] != NULL; index++){
    strcpy(ret, search_patch[index]);
    strncat(ret, cmd, strlen(cmd));
    if((fd = open(ret, O_RDONLY)) > 0){
      strncpy(cmd, ret, strlen(ret));
      close(fd);
      return 0;
    }
  }
  return 0;
}

void get_path_string(char **tmp_envp, char *bin_path){
  int count = 0;
  char *tmp;
  while(1) {
    tmp = strstr(tmp_envp[count], "PATH");
    if(tmp == NULL) {
      count++;
    } 
    else {
      break;
    }
  }
  strncpy(bin_path, tmp, strlen(tmp));
}

void insert_path_str_to_search(char *path_str){
  int index=0;
  char *tmp = path_str;
  char ret[100];
  while(*tmp != '='){
    tmp++;
    tmp++;
  }
  while(*tmp != '\0') {
    if(*tmp == ':') {
      strncat(ret, "/", 1);
      search_path[index] = (char *) malloc(sizeof(char) * (strlen(ret) + 1));
      strncat(search_path[index], ret, strlen(ret));
      strncat(search_path[index], "\0", 1);
      index++;
      bzero(ret, 100);
    } 
    else {
      strncat(ret, tmp, 1);
    }
    tmp++;
  }
}




int main(int argc, char *argv[], char *envp[]){

  char c;

  while(c!= EOF){
    c = fgetc(stdin);

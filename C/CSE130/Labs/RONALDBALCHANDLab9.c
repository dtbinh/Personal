//RONALD BALCHAND
//109806273
//CSE 130 LAB #8
//PARTNER: SAMANTHA ROSEN


#include <stdio.h>
#include <string.h>

#define MAX_LENGTH 10
#define MAX_USERS 3



int isUsername(char users[][MAX_LENGTH],
		char input[MAX_LENGTH]) {
  int userIndex = 0;

  for (userIndex = 0; userIndex < MAX_LENGTH;
       userIndex++)
    if(strcmp(users[userIndex], input) == 0)
      return userIndex;

  return -1;
}

//Checks if password is correct
int isPassword (char pass[][MAX_LENGTH],
		char input[MAX_LENGTH],int index) {

  if (strcmp(pass[index], input) == 0)
    return 1;

  return 0;
}

int main (void) {
  char username[MAX_USERS][MAX_LENGTH];
  char password[MAX_USERS][MAX_LENGTH];
  char input[2][MAX_LENGTH];
  int userIndex = -1;
  int retry = 0;
  int i = 0;

  sprintf(username[0], "Henrick");
  sprintf(password[0], "107508216");

  do {
    retry = 0;

    //Retrieves username
    printf("Username: ");
    scanf("%9s", input[0]);

    userIndex = isUsername(username, input[0]);

    //Handles incorrect username
    if (userIndex == -1) {
      system("cls");//Windows cheat codes
      system("clear");//Unix cheat codes
      printf("This username is not in use. ");
      printf("Try again.\n");
      retry = 1;
    }
    else {
      //Retrieves password
      for (i = 0; i < 3; i++) {
	printf("Password: ");
	scanf("%9s", input[1]);

	//Handles incorrect password
	if (isPassword(password, input[1],
		       userIndex)) {
	  printf("You have successfully ");
	  printf("logged in!\n");
	  i = 3;
	}
	else {
	  //Windows cheat codes
	  system("cls");
	  //Unix cheat codes
	  system("clear");
	  printf("Incorrect password. ");
	  printf("You have %d tries", 2 - i);
	  printf(" left.\n");
	}
      }
    }
  } while (retry);

  return 0;
}

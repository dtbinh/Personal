#include <stdio.h>


int main(null){

  int parts;
  printf("\nHow many items do you want to account for? ");
  scanf("%d", &parts);

  double numParts[parts];
  int partPercentage[parts];

  printf("\nEnter how much each part is worth. \n");
  int i;
  for(i = 0; i < parts; i++){//takes the percentage that each part represents as a whole
    printf("Section %d: ", (i+1));
    int percentage;
    scanf("%d", &percentage);
    fflush(stdin);
    partPercentage[i] = percentage;
  }

  

  int i2;
  for(i2 = 0; i2 < parts; i2++){//have to start filling each grade up
    printf("Do you wish to report your current grade or do you want to calculate an average for Section %d of your grade?(g/a)", (i2+1));
    char ans;
    scanf(" %c", &ans);
    
    //each grade can either be a single input or an average of parts
    
    if(ans == 'g'){//if the grade is a single input
      printf("Enter the grade you got for this part of your Overall grade: ");
      double ans2;
      scanf("%d", &ans2);
      numParts[i2] = ans2;
    }

    
    else if(ans == 'a'){//gotta create an average 
      printf("\nHow many items make up this portion of your grade?");
      int subItems;
      scanf("%d", &subItems);
      double subValues[subItems];

      
      printf("\nIs everything in this section worth the same amount equally(y/n)? ");
      char ans3;
      scanf(" %c", &ans3);
      if(ans3 == 'y'){//all of the items that make up this section are worth the same
	int i3;
	for(i3 = 0; i3 < subItems; i3++){//read all the values
	  double item;
	  printf("\nItem %d of Section %d: ",(i3 + 1), (i2 + 1));
	  scanf("%d", &item);
	  subValues[i3] = item;
	}

	double sum = 0.0;
	double average = 0.0;
	int k = 0;
	for(i3 = 0; i3 < subItems; i3++){
	  if(subValues[i3] != 0.0){
	    sum += subValues[i3];
	    k++;
	  }
	}

	if(k != 0){
	  average = sum/k;
	}
	numParts[i2] = average;//final assignment to the numParts
      
      }


      
      else if(ans3 == 'n'){//If everything in this item does not equal the same worth
	double subValuesPercentage[subItems];
	int i4;
	for(i4 = 0; i4 < subItems; i4++){//read the value and its percentage value
	  double value;
	  double valuePercentage;
	  
	  printf("\nItem %d of Section %d:  ", (i4 + 1), (i2 + 1));
	  scanf("%d", value);
	  subValues[i4] = value;

	  printf("\nPercentage value for this item: ");
	  scanf("%d", valuePercentage);
	  subValuesPercentage[i4] = valuePercentage;
	}

	double sum1 = 0.0;
	for(i4 = 0; i4 < subItems; i4++){
	  double tempPercent = .01 * subValuesPercentage[i4];
	  if(subValues[i4] != 0.0){
	    sum1 += (subValues[i4] * tempPercent);
	  }else{
	    sum1 += (100 * tempPercent);
	  }

	}

	numParts[i2] = sum1 * 100;//final assignment to numParts
      }
    }
  }
  
  printf("Here is a Breakdown of your grade based on what you put in: \nGrade      Percentage\n-----     ---------- \n");
  int i5;
  for(i5 = 0; i5 < parts; i5++){
    printf("%d       %d\n",numParts[i5],partPercentage[i5]);
  }
  
  double sum3;
  for(i5 = 0; i5 < parts; i5++){
    double tempPercent1 = .01 * partPercentage[i5];
    if(numParts[i5] != 0.0){
      sum3 += (tempPercent1 * numParts[i5]);
    }else{
      sum3 += (100 * tempPercent1);
    }
  }

  printf("Your grade currently in the class is %f", (sum3));
    
  return 0;
}
  
	      
	
      
	
      

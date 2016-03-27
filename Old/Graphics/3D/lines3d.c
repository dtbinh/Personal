#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "parse_util.h"
#include "mat4.h"


#define ROWS 600
#define COLS 600
#define TRUE 1
#define FALSE 0
#define PI 3.141592653589793238462643383



typedef struct pixel {

  int r;
  int g;
  int b;
}
 pixel;

char* pixeltostring(pixel pix) {
  char* str = malloc(sizeof(char) * 15);
  sprintf(str, "%d %d %d ", pix.r, pix.g, pix.b);
  return str;
}


pixel Pixels[ROWS][COLS];


double x_left, y_bottom, x_right, y_top;
// pixel** Pixels;

//int ROWS, COLS;


//  -------------------------------- DrawLine ---------------------------------
int DrawLine(int data[], int r, int g, int b) {
  int x1, y1, x2, y2, i;
  int up, dx, dy, acc;
  pixel color = (pixel){r, g, b};
  //return TRUE;
  for (i = 0; i < 4; i+=2)
    if (data[i] < 0 || data[i] >= COLS || data[i+1] < 0 || data[i+1] >= ROWS)
      return FALSE;

  x1 = data[0];
  y1 = data[1];
  x2 = data[2];
  y2 = data[3];

  // just a point?
  if (x1 == x2 && y1 == y2) {
    Pixels[y1][x1] = color;
    return TRUE;
  }

  // X-major?
  if (abs(x1-x2) >= abs(y1-y2)) {
    // if x1 > x2, reverse direction
    if (x1 > x2) {
      swap(&x1, &x2);
      swap(&y1, &y2);
    }
    dx = x2 - x1;
    dy = abs(y2 - y1);
    acc = dx >> 1;  // starting accumulator
    //printf("X-major\n");
    while (x1 <= x2) {
      if (x1 < 0 || x1 >= COLS || y1 < 0 || y1 >= ROWS) {
	printf("out of bounds: %d,%d\n",x1,y1);
	return FALSE;
      }
      Pixels[y1][x1] = color;
      ++x1;
      acc += dy;
      if (acc >= dx) {
	if (y2 >= y1)
	  ++y1;
	else
	  --y1;
	acc -= dx;
      }
    }
  }
  else {  // Y-major
    // if y1 > y2, reverse direction
    if (y1 > y2) {
      swap(&y1, &y2);
      swap(&x1, &x2);
    }
    dy = y2 - y1;
    dx = abs(x2 - x1);
    acc = dy >> 1;  // starting accumulator
    while (y1 <= y2) {
      Pixels[y1][x1] = color;
      ++y1;
      acc += dx;
      if (acc >= dy) {
	if (x2 >= x1)
	  ++x1;
	else
	  --x1;
	acc -= dy;
      }
    }
  }
  return TRUE;
}

// -------------------------------- abs --------------------------------
int abs(int n) {
  if (n >= 0)
    return n;
  return -n;
}

// ------------------------------------ swap -------------------------
void swap(int *a, int *b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}

Mat4 * matrix_Mult(Mat4 *matrix1, Mat4 * matrix2){
  //assume matrix1 == transformation & matrix2 == edge
  int c, d, k;
  int col1, col2, row2;
  double sum = 0;

  col1 = mat4_columns(matrix1);
  col2 = mat4_columns(matrix2);

  row2 = 4;
  //number cols depend on second matrix
  Mat4 * result = mat4_create( mat4_columns(matrix2));

  for ( c = 0 ; c < 4; c++ ){
    for ( d = 0 ; d < col2 ; d++ ){
      for ( k = 0 ; k < col1 ; k++ ){
	sum = sum + mat4_get(matrix1, c, k) * mat4_get(matrix2, k, d);
      }
      mat4_set(result, c, d, sum);

      sum = 0;
    }
  }

  return result;

}

int convert_screen(double num, char  * c){
  double px_left, py_bottom, px_right, py_top;
  double result;

  px_left = 0;
  py_bottom = -ROWS +1;
  px_right = COLS - 1;
  py_top = 0;


  if(strcmp(c, "x")==0){
    result = (((px_right - px_left)/(x_right - x_left)) * (num - x_left)) + px_left ;
  }
  if(strcmp(c, "y")==0){
    result = (((py_top - py_bottom)/(y_top - y_bottom)) *(num - y_bottom))+ py_bottom;
  }
  return (int)result;
}



int main(int argc, char* argv[]) {
  char* filename = malloc(sizeof(char) * 256);

  int numFrames = 1; // === number of frames
  int maxFrames = 1; //=== max number of frames

  vary variables[10]; //no more than 10 variables 
  int numVar = 0;

  //ROWS = COLS = 400;

  while(numFrames <= maxFrames){
    FILE* fp = fopen( argv[1], "r");
    //char * line = malloc(256* sizeof(char));
    char line[1000];
    char ** list;
    char ** list2;
    int x, y;

    Mat4 * triangles = mat4_create(0);
    Mat4 * edge = mat4_create(0);
    Mat4 * transformation = mat4_create_identity();

    //Pixels = malloc(ROWS * sizeof(*Pixels));

    // int i;
    // for(i = 0; i < ROWS; i++){
    //     Pixels[i] = malloc(COLS * sizeof(*Pixels));
    // }

    saved saves[10];
    int numSaved = 0;

    int red = 255;
    int green = 255;
    int blue = 255;

    if (argc != 2) {
      printf("Error: Usage: parse {filename}\n");
      return 0;
    }
        
    if ((fp = fopen(argv[1],"r")) == NULL) {
      printf("Unable to open %s for reading\n", argv[1]);
      return 0;
    }

    x = y = 0;

    while (y < ROWS) {
      while (x < COLS) {
	Pixels[y][x] = (pixel) {0,0,0};
	x++;
      }
      y++;
      x = 0;
    }

    while (1) {
      //printf("%s\n", fp);
      fgets(line,100,fp);
      //printf("hello\n");

      if (line[0] == '\n'){
	fgets(line,100,fp);
      }

      list = parse_split(line);

      if (strcmp(list[0], "end") == 0){
	//printf("done\n"); 
	break;
      }   
      if (strcmp(list[0], "#") == 0) 
	continue;
      else if (strcmp(list[0], "frames") == 0){
	maxFrames = atoi(list[2]);// assume frames always start at 1
      }

      else if (strcmp(list[0], "identity") == 0){
	transformation = mat4_create_identity();
      }
      else if (strcmp(list[0], "screen") == 0){
	x_left = atof(list[1]);
	y_bottom = atof(list[2]);
	x_right = atof(list[3]);
	y_top = atof(list[4]);
      }
      else if (strcmp(list[0], "pixels") == 0){//currently does nothing
	// ROWS = atoi(list[1]);
	// COLS = atoi(list[2]);

	// Pixels = (pixel **)realloc(Pixels, ROWS * sizeof(*Pixels));

	// int i;
	// for(i = 0; i < ROWS; i++){
	//     Pixels[i] = (pixel *)realloc(Pixels[i], COLS * sizeof(*Pixels[i]));
	// }
      }

      else if (strcmp(list[0], "vary") == 0){
	int q;

	if(numFrames == 1){

	  strcpy(variables[numVar].name,list[1]);
	  variables[numVar].startVal = atoi(list[2]);
	  variables[numVar].endVal = atoi(list[3]);
	  variables[numVar].startFrame = atoi(list[4]);
	  variables[numVar].endFrame = atoi(list[5]);
	  variables[numVar].curValue = atof(list[2]);


	  numVar++;

	}
      }
      else if (strcmp(list[0], "color") == 0){
	red = atoi(list[1]);
	green = atoi(list[2]);
	blue = atoi(list[3]);
      }
      else if (strcmp(list[0], "save") == 0){

	Mat4 * saving = mat4_copy(transformation);

	strcpy(saves[numSaved].name,list[1]);
	saves[numSaved].trans = saving;

	//printf("%s\n", saves[numSaved].name);
	numSaved++;
      }
      else if (strcmp(list[0], "restore") == 0){
	int i;
	for(i = 0; i < numSaved; i++){
	  if(strcmp(saves[i].name, list[1])==0)
	    transformation = saves[i].trans;
	  else if(i == numSaved - 1){
	    printf("%s != %s\n",saves[i].name, list[1]);
	  }
	}
      }
      else if (strcmp(list[0], "import") == 0){
	int r, c, q, v;
	double temp;
	Mat4 * imports;
	int count;

	for(q = 2; q <= 9; q++){
	  temp = atof(list[q]);

	  if(temp == 0.0 && strcmp(list[q],"0")){//if variable

	    for(v = 0; v < numVar; v++){

	      if(strcmp(list[q], variables[v].name)== 0 && numFrames >= variables[v].startFrame && numFrames <= variables[v].endFrame){//find variable
		char newVal[80];
		sprintf(newVal, "%f", variables[v].curValue);
		list[q] = newVal;//replace variable
	      }
	    }
	  }

	}


	Mat4 * scale = mat4_create_identity();
	mat4_set(scale, 0, 0, atof(list[2]));
	mat4_set(scale, 1, 1, atof(list[3]));
	mat4_set(scale, 2, 2, atof(list[4]));

	temp = atof(list[5]);
	Mat4 * xRotate = mat4_create_identity();
	mat4_set(xRotate, 1, 1, cos(temp* PI/180));
	mat4_set(xRotate, 1, 2, -sin(temp* PI/180));
	mat4_set(xRotate, 2, 1, sin(temp* PI/180));
	mat4_set(xRotate, 2, 2, cos(temp* PI/180));

	temp = atof(list[6]);
	Mat4 * yRotate = mat4_create_identity();
	mat4_set(yRotate, 0, 0, cos(temp* PI/180));
	mat4_set(yRotate, 0, 2, sin(temp* PI/180));
	mat4_set(yRotate, 2, 0, -1 * sin(temp* PI/180));
	mat4_set(yRotate, 2, 2, cos(temp* PI/180));


	temp = atof(list[7]);
	Mat4 * zRotate = mat4_create_identity();
	mat4_set(zRotate, 0, 0, cos(temp* PI/180));
	mat4_set(zRotate, 0, 1, -sin(temp* PI/180));
	mat4_set(zRotate, 1, 0, sin(temp* PI/180));
	mat4_set(zRotate, 1, 1, cos(temp* PI/180));

	Mat4 * translate = mat4_create_identity();
	mat4_set(translate, 0, 3, atof(list[8]));
	mat4_set(translate, 1, 3, atof(list[9]));
	mat4_set(translate, 2, 3, atof(list[10]));

	//importing points

	FILE* fp2 = fopen( list[1], "r");

	fgets(line,100,fp2);

	list = parse_split(line);

	if (strcmp(list[0], "#") == 0){
	  fgets(line,100,fp2);

	  list2 = parse_split(line);
	}
	count = atoi(list[0]);

	imports = mat4_create(0);


	while(count > 0){
	  fgets(line,256,fp2);


	  list = parse_split(line);


	  double pointA[4] = {atof(list[0]), atof(list[1]), atof(list[2]), 1};
	  double pointB[4] = {atof(list[3]), atof(list[4]), atof(list[5]), 1};
	  double pointC[4] = {atof(list[6]), atof(list[7]), atof(list[8]), 1};

	  mat4_add_column(imports, pointA);
	  mat4_add_column(imports, pointB);
	  mat4_add_column(imports, pointC);

	  count--;


	}

	//applying local transformation
	imports = matrix_Mult(scale, imports);
	imports = matrix_Mult(xRotate, imports);
	imports = matrix_Mult(yRotate, imports);
	imports = matrix_Mult(zRotate, imports);
	imports = matrix_Mult(translate, imports);

	if(numFrames==1){
	  for(c=0;c<mat4_columns(imports); c++){
	    if(c%3 == 0)
	      printf("\n");
	    for(r=0;r<3;r++){
	      printf("%f ", mat4_get(imports, r ,c));
	    }
	  }
	  printf("\n\n");
	}

	//applying world tranformation
	imports = matrix_Mult(transformation, imports);
	//adding to triangles

	triangles = mat4_combine(triangles, imports);


      }
      else if (strcmp(list[0], "rotate-x") == 0){
	double temp = atof(list[1]);

                
	int q;
	if (temp == 0.000000 && strcmp(list[1],"0") != 0 ){//checking for variable

	  for(q = 0; q < numVar; q++){
	    if(strcmp(list[1], variables[q].name)==0 && numFrames >= variables[q].startFrame && numFrames <= variables[q].endFrame){
	      temp = variables[q].curValue;
	    }
	  }
                    
	}

	Mat4 * xRotate = mat4_create_identity();
	mat4_set(xRotate, 1, 1, cos(temp* PI/180));
	mat4_set(xRotate, 1, 2, -sin(temp* PI/180));
	mat4_set(xRotate, 2, 1, sin(temp* PI/180));
	mat4_set(xRotate, 2, 2, cos(temp* PI/180));

	transformation = matrix_Mult(transformation, xRotate);
      }

      else if (strcmp(list[0], "rotate-y") == 0){
	double temp = atof(list[1]);
	int q;
	if (temp == 0.000000 && strcmp(list[1],"0") != 0 ){//checking for variable
	  for(q = 0; q < numVar; q++){
	    if(strcmp(list[1], variables[q].name)==0 && numFrames >= variables[q].startFrame && numFrames <= variables[q].endFrame){
	      temp = variables[q].curValue;
	    }
	  }
                    
	}
	//printf("%f\n", temp);

	Mat4 * yRotate = mat4_create_identity();
	mat4_set(yRotate, 0, 0, cos(temp* PI/180));
	mat4_set(yRotate, 0, 2, sin(temp* PI/180));
	mat4_set(yRotate, 2, 0, -1 * sin(temp* PI/180));
	mat4_set(yRotate, 2, 2, cos(temp* PI/180));

	transformation = matrix_Mult(transformation, yRotate);
      }

      else if (strcmp(list[0], "rotate-z") == 0){
	double temp = atof(list[1]);

	int q;
	if (temp == 0.0 && strcmp(list[1],"0") != 0){//checking for variable
	  for(q = 0; q < numVar; q++){
	    if (strcmp(list[1], variables[q].name) == 0 && numFrames >= variables[q].startFrame && numFrames <= variables[q].endFrame)
	      temp = variables[q].curValue;
	  }
	}

	Mat4 * zRotate = mat4_create_identity();
	mat4_set(zRotate, 0, 0, cos(temp* PI/180));
	mat4_set(zRotate, 0, 1, -sin(temp* PI/180));
	mat4_set(zRotate, 1, 0, sin(temp* PI/180));
	mat4_set(zRotate, 1, 1, cos(temp* PI/180));

	transformation = matrix_Mult(transformation, zRotate);
      }

      else if (strcmp(list[0], "move") == 0){
	Mat4 * translate = mat4_create_identity();

	int q, v;
	double temp;
	for(q = 1 ; q <= 3; q++){
	  temp = atof(list[q]);

	  if(temp == 0.0 && strcmp(list[q],"0") != 0){//if variable
	    for(v = 0; v < numVar; v++){
	      if(strcmp(list[q], variables[v].name)== 0 && numFrames >= variables[q].startFrame && numFrames <= variables[q].endFrame){//find variable
		char * newVal;
		sprintf(newVal, "%f", variables[v].curValue);
		list[q] = newVal;//replace variable
	      }
	    }
	  }
	}

	mat4_set(translate, 0, 3, atof(list[1]));
	mat4_set(translate, 1, 3, atof(list[2]));
	mat4_set(translate, 2, 3, atof(list[3]));

	transformation = matrix_Mult(transformation, translate);
      }

      else if (strcmp(list[0], "scale") == 0){
	Mat4 * scale = mat4_create_identity();

	int q, v;
	double temp;
	for(q = 1 ; q <= 3; q++){
	  temp = atof(list[q]);

	  if(temp == 0.0 && strcmp(list[q],"0") != 0){//if variable
	    for(v = 0; v < numVar; v++){
	      if(strcmp(list[q], variables[v].name)== 0 && numFrames >= variables[v].startFrame && numFrames <= variables[v].endFrame){//find variable
		char * newVal;
		sprintf(newVal, "%f", variables[v].curValue);
		list[q] = newVal;//replace variable
	      }
	    }
	  }
	}

	mat4_set(scale, 0, 0, atof(list[1]));
	mat4_set(scale, 1, 1, atof(list[2]));
	mat4_set(scale, 2, 2, atof(list[3]));

	transformation = matrix_Mult(transformation, scale);
      }

      else if (strcmp(list[0], "box-t") == 0){

	Mat4 * box = mat4_create(0);

	int q, v;
	double temp;
	for(q = 1; q <= 9; q++){
	  temp = atof(list[q]);

	  if(temp == 0.0 && strcmp(list[q],"0") != 0){//if variable
	    for(v = 0; v < numVar; v++){
	      if(strcmp(list[q], variables[v].name)== 0 && numFrames >= variables[v].startFrame && numFrames <= variables[v].endFrame){//find variable
		char * newVal;
		sprintf(newVal, "%f", variables[v].curValue);
		list[q] = newVal;//replace variable
	      }
	    }
	  }
	}

	double pointA[4] = {-.5, -.5, .5, 1}; // front vertices 
	double pointB[4] = {.5, -.5, .5, 1};
	double pointC[4] = {.5, .5, .5, 1};
	double pointD[4] = {-.5, .5, .5, 1};

	double pointE[4] = {.5, -.5, -.5, 1}; // back vertices
	double pointF[4] = {-.5, -.5, -.5, 1};
	double pointG[4] = {-.5, .5, -.5, 1};
	double pointH[4] = {.5, .5, -.5, 1};

	//adding triangles

	mat4_add_column(box, pointA);
	mat4_add_column(box, pointB);
	mat4_add_column(box, pointC);

	mat4_add_column(box, pointC);
	mat4_add_column(box, pointD);
	mat4_add_column(box, pointA);

	mat4_add_column(box, pointB);
	mat4_add_column(box, pointE);
	mat4_add_column(box, pointH);

	mat4_add_column(box, pointH);
	mat4_add_column(box, pointC);
	mat4_add_column(box, pointB);

	mat4_add_column(box, pointE);
	mat4_add_column(box, pointF);
	mat4_add_column(box, pointG);

	mat4_add_column(box, pointG);
	mat4_add_column(box, pointH);
	mat4_add_column(box, pointE);

	mat4_add_column(box, pointF);
	mat4_add_column(box, pointA);
	mat4_add_column(box, pointD);

	mat4_add_column(box, pointD);
	mat4_add_column(box, pointG);
	mat4_add_column(box, pointF);

	mat4_add_column(box, pointC);
	mat4_add_column(box, pointH);
	mat4_add_column(box, pointG);

	mat4_add_column(box, pointG);
	mat4_add_column(box, pointD);
	mat4_add_column(box, pointC);

	mat4_add_column(box, pointF);
	mat4_add_column(box, pointE);
	mat4_add_column(box, pointB);

	mat4_add_column(box, pointB);
	mat4_add_column(box, pointA);
	mat4_add_column(box, pointF);

	//applying local transformation
	//scale
	Mat4 * scale = mat4_create_identity();
	mat4_set(scale, 0, 0, atof(list[1]));
	mat4_set(scale, 1, 1, atof(list[2]));
	mat4_set(scale, 2, 2, atof(list[3]));
	box = matrix_Mult(scale, box);

	//rotateX
	Mat4 * rotateX = mat4_create_identity();
	mat4_set(rotateX, 1, 1, cos(atof(list[4]) * PI/180));
	mat4_set(rotateX, 1, 2, -sin(atof(list[4]) * PI/180));
	mat4_set(rotateX, 2, 1, sin(atof(list[4]) * PI/180));
	mat4_set(rotateX, 2, 2, cos(atof(list[4]) * PI/180));
	box = matrix_Mult(rotateX, box);

	//rotateY
	Mat4 * rotateY = mat4_create_identity();
	mat4_set(rotateY, 0, 0, cos(atof(list[5]) * PI/180));
	mat4_set(rotateY, 0, 2, sin(atof(list[5]) * PI/180));
	mat4_set(rotateY, 2, 0, -sin(atof(list[5]) * PI/180));
	mat4_set(rotateY, 2, 2, cos(atof(list[5]) * PI/180));
	box = matrix_Mult(rotateY, box);

	//rotateZ
	Mat4 * rotateZ = mat4_create_identity();
	mat4_set(rotateZ, 0, 0, cos(atof(list[6]) * PI/180));
	mat4_set(rotateZ, 0, 1, -sin(atof(list[6]) * PI/180));
	mat4_set(rotateZ, 1, 0, sin(atof(list[6]) * PI/180));
	mat4_set(rotateZ, 1, 1, cos(atof(list[6]) * PI/180));
	box = matrix_Mult(rotateZ, box);


	//move
	Mat4 * move = mat4_create_identity();
	mat4_set(move, 0, 3, atof(list[7]));
	mat4_set(move, 1, 3, atof(list[8]));
	mat4_set(move, 2, 3, atof(list[9]));
	box = matrix_Mult(move, box);

	//applying world transformation
	box = matrix_Mult(transformation, box);
	//put box -->triangles

	triangles = mat4_combine(triangles, box);
      }
      else if (strcmp(list[0], "sphere-t") == 0){

	Mat4 * sphere = mat4_create(0);

	Mat4 * longitudesA = mat4_create(0);
	Mat4 * longitudesB = mat4_create(0);

	int angleTheta, anglePhi;
	double point[4];
	point[3] = 1;

	int q, v;
	double temp;

	for(q = 1 ; q <= 9; q++){
	  temp = atof(list[q]);

	  if(temp == 0.0 && strcmp(list[q],"0") != 0){//if variable
	    for(v = 0; v < numVar; v++){

	      if(strcmp(list[q], variables[v].name)== 0 && numFrames >= variables[v].startFrame && numFrames <= variables[v].endFrame){//find variable
		char newVal[48];
		sprintf(newVal, "%f", variables[v].curValue);

		list[q] = newVal;//replace variable
	      }
	    }
	  }


	}
	for(angleTheta =0; angleTheta < 360;){
	  for(anglePhi = 0; anglePhi<= 180;anglePhi+=15){
	    point[0] = sin(anglePhi * PI/180) * cos(angleTheta * PI/180);
	    point[1] = (cos(anglePhi * PI/180));
	    point[2] = sin(anglePhi * PI/180) * sin(angleTheta * PI/180);

	    mat4_add_column(longitudesB, point);
	  }

	  angleTheta+=15;

	  for(anglePhi =0; anglePhi<= 180;anglePhi+=15){
	    point[0] = sin(anglePhi * PI/180) * cos(angleTheta * PI/180);
	    point[1] = (cos(anglePhi * PI/180));
	    point[2] = sin(anglePhi * PI/180) * sin(angleTheta * PI/180);

	    mat4_add_column(longitudesA, point);

	  }

	  //turns top most points into triangle

	  //printf("+++triangle start+++\n");
	  point[0] = mat4_get(longitudesA, 0, 0);
	  point[1] = mat4_get(longitudesA, 1, 0);
	  point[2] = mat4_get(longitudesA, 2, 0);
	  //printf("%f %f %f\n", point[0], point[1], point[2]);
	  mat4_add_column(sphere, point);

	  point[0] = mat4_get(longitudesA, 0, 1);
	  point[1] = mat4_get(longitudesA, 1, 1);
	  point[2] = mat4_get(longitudesA, 2, 1);
	  // printf("%f %f %f\n", point[0], point[1], point[2]);
	  mat4_add_column(sphere, point);

	  point[0] = mat4_get(longitudesB, 0, 1);
	  point[1] = mat4_get(longitudesB, 1, 1);
	  point[2] = mat4_get(longitudesB, 2, 1);
	  //printf("%f %f %f\n", point[0], point[1], point[2]);
	  mat4_add_column(sphere, point);

	  //  making triangle faces

	  int c;

	  for(c = 2; c < mat4_columns(longitudesA) - 1; c++){
	    //one triangle
	    point[0] = mat4_get(longitudesB, 0, c);
	    point[1] = mat4_get(longitudesB, 1, c);
	    point[2] = mat4_get(longitudesB, 2, c);
	    mat4_add_column(sphere, point);

	    point[0] = mat4_get(longitudesB, 0, c-1);
	    point[1] = mat4_get(longitudesB, 1, c-1);
	    point[2] = mat4_get(longitudesB, 2, c-1);
	    mat4_add_column(sphere, point);

	    point[0] = mat4_get(longitudesA, 0, c-1);
	    point[1] = mat4_get(longitudesA, 1, c-1);
	    point[2] = mat4_get(longitudesA, 2, c-1);
	    mat4_add_column(sphere, point);

	    //the other one
	    point[0] = mat4_get(longitudesA, 0, c-1);
	    point[1] = mat4_get(longitudesA, 1, c-1);
	    point[2] = mat4_get(longitudesA, 2, c-1);
	    mat4_add_column(sphere, point);

	    point[0] = mat4_get(longitudesA, 0, c);
	    point[1] = mat4_get(longitudesA, 1, c);
	    point[2] = mat4_get(longitudesA, 2, c);
	    mat4_add_column(sphere, point);

	    point[0] = mat4_get(longitudesB, 0, c);
	    point[1] = mat4_get(longitudesB, 1, c);
	    point[2] = mat4_get(longitudesB, 2, c);
	    mat4_add_column(sphere, point);
	  }

	  //making bottom triangle

	  point[0] = mat4_get(longitudesB, 0, mat4_columns(longitudesB)-1);
	  point[1] = mat4_get(longitudesB, 1, mat4_columns(longitudesB)-1);
	  point[2] = mat4_get(longitudesB, 2, mat4_columns(longitudesB)-1);
	  mat4_add_column(sphere, point);

	  point[0] = mat4_get(longitudesB, 0, mat4_columns(longitudesB)-2);
	  point[1] = mat4_get(longitudesB, 1, mat4_columns(longitudesB)-2);
	  point[2] = mat4_get(longitudesB, 2, mat4_columns(longitudesB)-2);
	  mat4_add_column(sphere, point);

	  point[0] = mat4_get(longitudesA, 0, mat4_columns(longitudesB)-2);
	  point[1] = mat4_get(longitudesA, 1, mat4_columns(longitudesB)-2);
	  point[2] = mat4_get(longitudesA, 2, mat4_columns(longitudesB)-2);
	  mat4_add_column(sphere, point);

	  longitudesA = mat4_create(0);
	  longitudesB = mat4_create(0);

	}

	//applying local transformation
	//scale
	Mat4 * scale = mat4_create_identity();
	mat4_set(scale, 0, 0, atof(list[1]));
	mat4_set(scale, 1, 1, atof(list[2]));
	mat4_set(scale, 2, 2, atof(list[3]));
	sphere = matrix_Mult(scale, sphere);

	//rotateX
	Mat4 * rotateX = mat4_create_identity();
	mat4_set(rotateX, 1, 1, cos(atof(list[4]) * PI/180));
	mat4_set(rotateX, 1, 2, -sin(atof(list[4]) * PI/180));
	mat4_set(rotateX, 2, 1, sin(atof(list[4]) * PI/180));
	mat4_set(rotateX, 2, 2, cos(atof(list[4]) * PI/180));
	sphere = matrix_Mult(rotateX, sphere);

	//rotateY
	Mat4 * rotateY = mat4_create_identity();
	mat4_set(rotateY, 0, 0, cos(atof(list[5]) * PI/180));
	mat4_set(rotateY, 0, 2, sin(atof(list[5]) * PI/180));
	mat4_set(rotateY, 2, 0, -sin(atof(list[5]) * PI/180));
	mat4_set(rotateY, 2, 2, cos(atof(list[5]) * PI/180));
	sphere = matrix_Mult(rotateY, sphere);

	//rotateZ
	Mat4 * rotateZ = mat4_create_identity();
	mat4_set(rotateZ, 0, 0, cos(atof(list[6]) * PI/180));
	mat4_set(rotateZ, 0, 1, -1 *sin(atof(list[6]) * PI/180));
	mat4_set(rotateZ, 1, 0, sin(atof(list[6]) * PI/180));
	mat4_set(rotateZ, 1, 1, cos(atof(list[6]) * PI/180));
	sphere = matrix_Mult(rotateZ, sphere);


	//move
	Mat4 * move = mat4_create_identity();
	mat4_set(move, 0, 3, atof(list[7]));
	mat4_set(move, 1, 3, atof(list[8]));
	mat4_set(move, 2, 3, atof(list[9]));
	sphere = matrix_Mult(move, sphere);

	//applying world transformation

	sphere = matrix_Mult(transformation, sphere);
	//put box -->triangles
	triangles = mat4_combine(triangles, sphere);

      }



      else if (strcmp(list[0], "render-parallel") == 0){
	double eye[3] = {0, 0, 0};
	triangles = theCulling(triangles, "p", eye);
	trianglesToEdge(triangles, edge);

	int numLines = mat4_columns(edge);
	int i, x1, y1, x2, y2;
	int data[4];
	int data2[4];

	for(i = 0; i < numLines; i+=2){

	  x1 = convert_screen(mat4_get(edge, 0, i), "x");
	  y1 = convert_screen(mat4_get(edge, 1, i), "y");
	  x2 = convert_screen(mat4_get(edge, 0, i+1), "x");
	  y2 = convert_screen(mat4_get(edge, 1, i+1), "y");

	  //convert_points();
	  data[0]= x1;
	  data[1]= -1 * y1;
	  data[2]= x2;
	  data[3]= -1 * y2;

	  DrawLine(data, red, green, blue);

	}
      }

      else if (strcmp(list[0], "render-perspective-cyclops") == 0){
	int i, x1, y1, x2, y2; 
	double rx, ry, rz;  //eye location
	int data[4];            
	int data2[4];

	rx = atof(list[1]);
	ry = atof(list[2]);
	rz = atof(list[3]);



	double coors[3] = {rx, ry, rz};

	triangles = theCulling(triangles, "c", coors);
	trianglesToEdge(triangles, edge);

	int numLines = mat4_columns(edge);

	render_cyclops(edge, coors); // changes edge matrix to cyclops coors


	for(i = 0; i < numLines; i+=2){

	  x1 = convert_screen(mat4_get(edge, 0, i), "x");
	  y1 = convert_screen(mat4_get(edge, 1, i), "y");
	  x2 = convert_screen(mat4_get(edge, 0, i+1), "x");
	  y2 = convert_screen(mat4_get(edge, 1, i+1), "y");

	  //convert_points();
	  data[0]= x1;
	  data[1]= -1 * y1; //needs negation.. not sure why
	  data[2]= x2;
	  data[3]= -1 * y2;

	  DrawLine(data, red, green, blue);
	}

      }

      else if (strcmp(list[0], "render-perspective-stereo") == 0){

	trianglesToEdge(triangles, edge);
	int originalLength = mat4_columns(edge);
	int i, x1, y1, x2, y2; 
	double lx, ly, lz, rx, ry, rz;  //eye location
	int data[4];            
	int data2[4];

	lx = atof(list[1]);
	ly = atof(list[2]);
	lz = atof(list[3]);

	rx = atof(list[4]);
	ry = atof(list[5]);
	rz = atof(list[6]);


	double coors1[3] = {lx, ly, lz};
	double coors2[3] = {rx, ry, rz};
	render_stereo(edge, coors1, coors2); // changes edge matrix to cyclops coors

	int numLines = mat4_columns(edge);
	for(i = 0; i < numLines; i+=2){

	  x1 = convert_screen(mat4_get(edge, 0, i), "x");
	  y1 = convert_screen(mat4_get(edge, 1, i), "y");
	  x2 = convert_screen(mat4_get(edge, 0, i+1), "x");
	  y2 = convert_screen(mat4_get(edge, 1, i+1), "y");

	  //convert_points();
	  data[0]= x1;
	  data[1]=  -1 *y1; //needs negation.. not sure why
	  data[2]= x2;
	  data[3]= -1 * y2;

	  if( i < originalLength){
	    DrawLine(data, 255, 0, 0);
	  }
	  else{
	    DrawLine(data, 0, 255, 255);
	  } 
	}

      }

      else if (strcmp(list[0], "file") == 0 || strcmp(list[0], "files") == 0){
	sscanf(list[1],"%s", filename);  
      }

    }   

    //WRITING IMAGE

    char* fileExten = malloc(sizeof(char) * 256);


    if(numFrames ==1 && maxFrames ==1)
      sprintf(fileExten,"%s", filename);
    else if(numFrames < 10)
      sprintf(fileExten,"%s00%d.ppm", filename, numFrames);
    else if(numFrames < 100)
      sprintf(fileExten,"%s0%d.ppm", filename, numFrames);
    else if(numFrames < 1000)
      sprintf(fileExten,"%s%d.ppm", filename, numFrames);

    fp = fopen(fileExten, "w");

    free(fileExten);

    fprintf(fp, "P3\n%d %d\n255\n", COLS, ROWS);
    x = y = 0;

    char * c;
    while (y < ROWS) {
      while (x < COLS) {
	c = pixeltostring(Pixels[y][x]);
	fputs(c, fp);    

	free(c);   
	x++;
      }

      fputs("\n", fp);
      x = 0;
      y++;
    }



    //updating variables
    int v;
    for(v = 0; v < numVar; v++){
      if(numFrames >=variables[v].startFrame && numFrames <= variables[v].endFrame){
	variables[v].curValue +=((double)(variables[v].endVal -variables[v].startVal))/(variables[v].endFrame - variables[v].startFrame);
      }
    }

    //printf("Frame: %d\n", numFrames);

    numFrames++;


    free(filename);
        
    // for(v = 0; v< ROWS; v++){
    //     free(Pixels[v]);
    // }

    // free(Pixels);
    //free(line);

    fputc(' ', fp);
    fputc(EOF, fp);

    fclose(fp);

  }
  return 0;

}

int convert_screen(double num, char  * c){
  double px_left, py_bottom, px_right, py_top;
  double result;

  px_left = 0;
  py_bottom = -ROWS +1;
  px_right = COLS - 1;
  py_top = 0;


  if(strcmp(c, "x")==0){
    result = (((px_right - px_left)/(x_right - x_left)) * (num - x_left)) + px_left ;
  }
  if(strcmp(c, "y")==0){
    result = (((py_top - py_bottom)/(y_top - y_bottom)) *(num - y_bottom))+ py_bottom;
  }
  return (int)result;
}


//  -------------------------------- DrawLine ---------------------------------
int DrawLine(int data[], int r, int g, int b) {
  int x1, y1, x2, y2, i;
  int up, dx, dy, acc;
  pixel color = (pixel){r, g, b};
  //return TRUE;
  for (i = 0; i < 4; i+=2)
    if (data[i] < 0 || data[i] >= COLS || data[i+1] < 0 || data[i+1] >= ROWS)
      return FALSE;

  x1 = data[0];
  y1 = data[1];
  x2 = data[2];
  y2 = data[3];

  // just a point?
  if (x1 == x2 && y1 == y2) {
    Pixels[y1][x1] = color;
    return TRUE;
  }

  // X-major?
  if (abs(x1-x2) >= abs(y1-y2)) {
    // if x1 > x2, reverse direction
    if (x1 > x2) {
      swap(&x1, &x2);
      swap(&y1, &y2);
    }
    dx = x2 - x1;
    dy = abs(y2 - y1);
    acc = dx >> 1;  // starting accumulator
    //printf("X-major\n");
    while (x1 <= x2) {
      if (x1 < 0 || x1 >= COLS || y1 < 0 || y1 >= ROWS) {
	printf("out of bounds: %d,%d\n",x1,y1);
	return FALSE;
      }
      Pixels[y1][x1] = color;
      ++x1;
      acc += dy;
      if (acc >= dx) {
	if (y2 >= y1)
	  ++y1;
	else
	  --y1;
	acc -= dx;
      }
    }
  }
  else {  // Y-major
    // if y1 > y2, reverse direction
    if (y1 > y2) {
      swap(&y1, &y2);
      swap(&x1, &x2);
    }
    dy = y2 - y1;
    dx = abs(x2 - x1);
    acc = dy >> 1;  // starting accumulator
    while (y1 <= y2) {
      Pixels[y1][x1] = color;
      ++y1;
      acc += dx;
      if (acc >= dy) {
	if (x2 >= x1)
	  ++x1;
	else
	  --x1;
	acc -= dy;
      }
    }
  }
  return TRUE;
}

//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {
int snakeX;
int snakeY;
//Add x and y member variables. They will hold the corner location of each segment of the snake.


// Add a constructor with parameters to initialize each variable.
Segment(int x, int y){
this.snakeX = x;
this.snakeY = y;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
int foodX;
int foodY;
int snakeDirection = UP;
int foodEaten = 0;
ArrayList segments = new ArrayList();



//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(250, 250);
frameRate(13);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(#6C6A6A);
  drawFood();
  move();
  drawSnake();
  checkBoundaries();
  eat();
}

void drawFood() {
  //Draw the food
    fill(#FF0000);
  rect(foodX, foodY, 20, 20);
  
}

void drawSnake() {
  
  fill(#FFF703);//Draw the head of the snake followed by its tail
  rect(head.snakeX, head.snakeY, 20, 20);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if(snakeDirection != DOWN){
      snakeDirection = UP;
      }
    }
      else if (keyCode == DOWN) {
        if(snakeDirection != UP){
      snakeDirection = DOWN;
        }
    }
        else if (keyCode == LEFT) {
      if(snakeDirection != RIGHT){
          snakeDirection = LEFT;
    }
        }
        else if (keyCode == RIGHT) {
      if(snakeDirection != LEFT){
          snakeDirection = RIGHT;
    }
        }
  }
}
void move() {
  //Change the location of the Snake head based on the direction it is moving.
 
  switch(snakeDirection) {
  case UP:
    head.snakeY -= 10;
    break;
  case DOWN:
head.snakeY += 10;
    break;
  case LEFT:
head.snakeX -= 10;
    break;
  case RIGHT:
head.snakeX += 10;
    break;
  }
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.snakeY >= 500){
   head.snakeY = 0;
 }

if(head.snakeX >= 500){
   head.snakeX = 0;
 }

if(head.snakeY <= -1){
   head.snakeY = 500;
 }
if(head.snakeX <= -1){
   head.snakeX = 500;
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(dist(head.snakeX, head.snakeY, foodX, foodY) <= 20){
foodEaten++;
dropFood();
  }
}

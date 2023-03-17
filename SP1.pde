//mini not all finished mini game
//where you have to click the ball while its moving 
//the more click the more faster ball goes
//if click missed lose life / hearts and meed to restart game
int ball = 40;       
float xPosition, yPosition;     

int xyspeed = 4;  // Speed of the shape
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

String welcome ="";
int scorePoints = 0;
int heartPoints = 4;
boolean resetGame = false;

void setup() 
{
  size(640, 360);
  fill(255,180,220);
  noStroke(); //remove black out line
  textSize(18);
  xPosition = width/2;
  yPosition = height/2;
  // Set the starting position of the shape

}
void draw() 
{
  background(160);
  
  // make ball change postion / follow from speed
  xPosition = xPosition + ( xyspeed * xdirection );
  yPosition = yPosition + ( xyspeed * ydirection );
  
  // make the balll able to bounce back if hit wall 
  if (xPosition > width-ball || xPosition < ball) {
    xdirection *= -1;
  }
  if (yPosition > height-ball || yPosition < ball) {
    ydirection *= -1;
  }
  //(text) to print out the top text part 
  ellipse(xPosition, yPosition, ball, ball);
  text("Welcome to click the ball game! " + welcome, 10, 16);
  text("How to play: clicking on the ball level goes up, miss gameover" + welcome, 10,35);
  text("Score points : " +scorePoints,10,55);
  text("Hearts : " + heartPoints, 10,75);
  
  if(heartPoints <= 0){
    textSize(18);
    text("Tap to restart", 260,180);
    resetGame = true;
    textSize(18);
  }
}
void mousePressed(){
  // dist = distance between two points
  if(dist(mouseX, mouseY, xPosition, yPosition)<=ball){
    
    scorePoints = scorePoints + xyspeed;
    xyspeed = xyspeed + 1; 
    
  }else{
    if (xyspeed < 1){
      xyspeed = xyspeed - 1;
    } //each time you miss minus - heart points
      heartPoints = heartPoints - 1;  
    } // restset the whole game : 
    if (resetGame == true){
      loop(); //loop ttouhg the game when restart 
      //write the game variables down   
 
    }
}

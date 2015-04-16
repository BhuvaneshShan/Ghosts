int FrameRate = 5;
// 2D Array of objects
Cell[][] grid;
Ghost[] ghost;
Hero hero;
// Number of columns and rows in the grid
int cols = 30;
int rows = 30;
int colWidth = 20;
int rowHeight = 20;
int EMPTY = 0; int HERO = 1; int GHOST=2; int FOOD = 3; int GEM = 4; int WALL = 5; //Cell types
int ghostCount = 0;
int moves = 0;
int foodCollected =0;
int gameRunning = 1;// 0 = game over 1 = game is running
boolean freezeTime = false;
int freezeTimeCount = 0; //For 20 moves ghosts become inactive, if Hero finds a gem
PFont f;
int MaxTimeAllowed= 5; //5 millisec for hero update
void setup() {
  size(600,620); //30*20=600; each cell is 20 pixels in width and height //Extra 10 for displaying moves and food collected
  frameRate(FrameRate);
  ellipseMode(CORNER);
  f = createFont("Arial",25,true);
  grid = new Cell[cols][rows];
  ghost = new Ghost[4];
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*colWidth,j*rowHeight,colWidth,rowHeight,EMPTY);//each cell is 20 pixels in width and height
      if(map[j][i] == GHOST){
        ghost[ghostCount]=new Ghost(i,j);
        ghostCount++;
      }else if(map[j][i]==HERO){
        hero = new Hero(i,j);
      }else{
        grid[i][j].type = map[j][i];
      }
    }
  }
}
void draw() {
  if(gameRunning==1){
    background(0);
    moves++;
    
    
    if(freezeTime==false){
       for(int r=0;r<ghostCount;r++){
        ghost[r].update();
      }
    }else{
      freezeTimeCount++;
      if(freezeTimeCount==20){
        freezeTime=false;
        freezeTimeCount=0;
      }
    }
    checkHeroGhostCollision();
    
    HeroMove();
    
    // The counter variables i and j are also the column and row numbers and 
    // are used as arguments to the constructor for each object in the grid.  
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j].display();
      }
    }
    displayHero();
    displayGhosts();
    displayText();
  }else{
    //Game Over
    textFont(f,50);                 
    fill(255);                        
    text("GAME OVER",10,70);
    textFont(f,25);
    text("Moves",10,110);
    textFont(f,50);
    text(str(moves),10,160);
    textFont(f,25);
    text("Food Collected",10,200);
    textFont(f,50);
    text(str(foodCollected),10,250);
  }
}

int getCellType(int col,int row){
  for(int r=0;r<ghostCount;r++){
    if(col==ghost[r].curCol && row==ghost[r].curRow){
      return GHOST;
    }
  }
  return grid[col][row].type;
}
void checkHeroGhostCollision(){
  println("Hero:"+hero.curCol+","+hero.curRow);
  for(int r=0;r<ghostCount;r++){
    println("Ghost"+r+":"+ghost[r].curCol+","+ghost[r].curRow);
    if(hero.curCol==ghost[r].curCol && hero.curRow==ghost[r].curRow){
      println("hit");
      gameRunning=0;
    }
  }
}
boolean isHeroCell(int col,int row){
  if(col==hero.curCol && row==hero.curRow){
    return true;
  }else{
    return false;
  }
}
void HeroMove(){
  int hCol= hero.curCol; //get hero's position before update so that user doesnt meddle with player pos directly
  int hRow = hero.curRow;
  int then = millis();
  String heroMove=hero.Update(); //update hero
  int now = millis() - then;
  if(now>MaxTimeAllowed){ gameRunning=0; println("Over time"); }
  
 // println("then:"+then+" now:"+now); 
  
  if(heroMove.equals("UP")){ hRow-=1;}
  else if(heroMove.equals("RIGHT")){ hCol+=1;}
  else if(heroMove.equals("DOWN")){ hRow+=1;} 
  else { hCol-=1;} 
  
  if(grid[hCol][hRow].type==WALL) {gameRunning=0;}//Game Over
  else if(grid[hCol][hRow].type==FOOD){ foodCollected++; grid[hCol][hRow].type=EMPTY;}
  else if(grid[hCol][hRow].type==GEM){grid[hCol][hRow].type=EMPTY; freezeTime=true; }//freeze code to write
  for(int r=0;r<ghostCount;r++){
    if(hCol==ghost[r].curCol && hRow==ghost[r].curRow){gameRunning=0;}
  }
  hero.curCol=hCol;
  hero.curRow=hRow;
}
int[][] getGhostPositions(){
  int[][] positions = new int[4][2];
  for(int r=0;r<ghostCount;r++){
    positions[r][0]=ghost[r].curCol;
    positions[r][1]=ghost[r].curRow;
  }
  return positions;
}
void displayGhosts(){
  PVector pos;
  fill(#FFFFFF);
  for(int r=0;r<ghostCount;r++){
    pos = ghost[r].getPosition();
    rect(pos.x*colWidth,pos.y*rowHeight,colWidth,rowHeight);
  }
}
void displayHero(){
  fill(#FFC74D);
  rect(hero.curCol*colWidth,hero.curRow*rowHeight,colWidth,rowHeight);
}
void displayText(){
    textFont(f,10);                 
    fill(255);                        
    text("Moves",10,615);
    text(str(moves),50,615);
    text("Food Collected",100,615);
    text(str(foodCollected),200,615);
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  int type; // type can be ghosts or food or gem or hero

  Cell(float tempX, float tempY, float tempW, float tempH, int tempType) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    type = tempType;
  } 
  
  void display() {
    noStroke();
    if(type==EMPTY)
    {
      fill(0);
      rect(x,y,w,h); 
    }
    else if(type==WALL)
    {
       fill(#486FA5);
       rect(x,y,w,h); 
    }
    else if(type==FOOD)
    {
       fill(0);
       rect(x,y,w,h); 
       stroke(#FFCA58);
       fill(#FFCA58);
       ellipse(x+8,y+8,w-16,h-16);
    }
    else if(type==GHOST)
    {
      fill(#FFFFFF);
      rect(x,y,w,h);
    }
    else if(type==HERO)
    {
       fill(#FFC74D);
       rect(x,y,w,h); 
    }
    else if(type==GEM)
    {
       stroke(#50D340);
       fill(#50D340);
       triangle(x+3,y+8,x+17,y+8,x+10,y+15);
       quad(x+3,y+8,x+7,y+4,x+13,y+4,x+17,y+8);
    }
  }
}

int[][] map={
  {5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5},
  {5,  2,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  5,  5,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  5},
  {5,  3,  5,  5,  5,  5,  5,  3,  5,  5,  5,  5,  5,  3,  5,  5,  3,  5,  5,  5,  5,  5,  3,  5,  5,  5,  5,  5,  3,  5},
  {5,  3,  5,  5,  5,  5,  5,  3,  5,  5,  5,  5,  5,  3,  5,  5,  3,  5,  5,  5,  5,  5,  0,  5,  5,  5,  5,  5,  3,  5},
  {5,  3,  5,  5,  5,  5,  5,  3,  5,  5,  5,  5,  5,  3,  5,  5,  3,  5,  5,  5,  5,  5,  0,  5,  5,  5,  5,  5,  3,  5},
  {5,  3,  3,  3,  3,  3,  3,  3,  3,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  3,  4,  3,  3,  3,  3,  3,  3,  5},
  {5,  3,  5,  5,  5,  5,  5,  3,  5,  3,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  3,  5,  3,  5,  5,  5,  5,  5,  3,  5},
  {5,  3,  5,  5,  4,  5,  5,  3,  5,  3,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  3,  5,  3,  5,  5,  3,  5,  5,  3,  5},
  {5,  3,  5,  5,  0,  5,  5,  3,  5,  3,  3,  3,  3,  3,  5,  5,  3,  3,  3,  3,  3,  5,  3,  5,  5,  3,  5,  5,  3,  5},
  {5,  3,  3,  3,  3,  3,  3,  3,  5,  5,  5,  5,  5,  3,  5,  5,  3,  5,  5,  5,  5,  5,  3,  3,  3,  3,  3,  3,  2,  5},
  {5,  3,  5,  5,  5,  3,  5,  3,  5,  2,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  5,  3,  3,  3,  5,  5,  5,  3,  5},
  {5,  3,  5,  5,  5,  3,  5,  0,  5,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  5,  0,  3,  3,  5,  5,  5,  0,  5},
  {5,  3,  5,  5,  5,  3,  5,  3,  5,  3,  3,  5,  5,  5,  0,  0,  5,  5,  5,  3,  3,  5,  3,  3,  3,  5,  5,  5,  3,  5},
  {5,  3,  5,  5,  5,  3,  5,  3,  5,  3,  3,  5,  3,  3,  3,  3,  3,  3,  5,  3,  3,  5,  3,  3,  3,  5,  5,  5,  3,  5},
  {5,  0,  0,  3,  3,  3,  3,  3,  0,  3,  3,  5,  3,  3,  3,  3,  3,  3,  5,  3,  3,  0,  3,  3,  3,  3,  3,  3,  3,  5},
  {5,  3,  5,  5,  5,  3,  5,  3,  5,  3,  3,  5,  3,  3,  3,  3,  3,  3,  5,  3,  3,  5,  3,  5,  3,  5,  5,  5,  3,  5},
  {5,  3,  5,  5,  5,  3,  5,  3,  5,  3,  3,  5,  5,  5,  5,  5,  5,  5,  5,  3,  3,  5,  3,  5,  3,  5,  5,  5,  3,  5},
  {5,  3,  5,  3,  0,  3,  5,  3,  5,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  5,  0,  5,  3,  3,  3,  5,  3,  5},
  {5,  3,  5,  3,  3,  3,  5,  3,  5,  0,  3,  5,  5,  5,  5,  5,  5,  5,  5,  3,  0,  5,  3,  5,  3,  0,  4,  5,  0,  5},
  {5,  3,  5,  5,  5,  3,  5,  3,  3,  3,  3,  3,  3,  3,  5,  5,  3,  3,  3,  3,  3,  3,  3,  5,  3,  5,  5,  5,  3,  5},
  {5,  3,  5,  5,  5,  3,  5,  3,  5,  5,  5,  5,  5,  3,  5,  5,  3,  5,  5,  5,  5,  5,  3,  5,  3,  5,  5,  5,  3,  5},
  {5,  0,  3,  3,  3,  3,  3,  4,  3,  3,  3,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  2,  3,  3,  3,  3,  3,  3,  3,  5},
  {5,  0,  5,  5,  5,  5,  3,  5,  5,  5,  3,  0,  0,  3,  5,  5,  3,  3,  3,  3,  5,  5,  5,  3,  5,  5,  5,  5,  3,  5},
  {5,  0,  5,  5,  5,  5,  3,  3,  3,  3,  3,  5,  5,  5,  5,  5,  5,  5,  5,  3,  3,  3,  3,  3,  5,  5,  5,  5,  3,  5},
  {5,  3,  3,  3,  3,  5,  3,  5,  3,  5,  3,  3,  3,  3,  5,  5,  3,  3,  3,  3,  5,  3,  5,  3,  5,  3,  3,  3,  3,  5},
  {5,  5,  5,  5,  3,  5,  3,  5,  3,  5,  3,  5,  5,  5,  5,  5,  5,  5,  5,  3,  5,  3,  5,  3,  5,  3,  5,  5,  5,  5},
  {5,  3,  3,  3,  3,  3,  3,  5,  3,  3,  3,  3,  3,  3,  5,  5,  3,  3,  3,  3,  3,  3,  5,  3,  3,  3,  3,  3,  3,  5},
  {5,  3,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  3,  5,  5,  3,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  3,  5},
  {5,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  1,  3,  3,  3,  3,  3,  3,  0,  0,  0,  0,  3,  3,  3,  3,  5},
  {5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5}
};                                                         //

class Ghost{
  int curCol,curRow;
  int state=0; //0=at rest 1=in motion
  int dir=0; //0=up 1 = right 2 = down 3= left
   Ghost(int i,int j){
    curCol=i;
    curRow=j;
    state=0;
   } 
   PVector getPosition(){
     return new PVector(curCol,curRow);
   }
   void update(){ //todo: hero chasing; expose func to get col row of ghosts directly 
     if(state==0){
       state=1;
       dir=randomDirection();
     }
     else{
       int front=cellType(dir); int back = cellType((dir+2)%4); 
       int perpendi1 = cellType((dir+1)%4); int perpendi2=cellType((dir-1+4)%4);
       int tempDir=dir;
       if(front==WALL){
         tempDir=(dir+2)%4; //for safety assign back dir
       }
       if( perpendi1!=WALL || perpendi2!=WALL){
         if(front==WALL){
            if(perpendi1!=WALL) tempDir=(dir+1)%4;
            else tempDir=(dir-1+4)%4;
         }else if(random(100)<50){
           if(perpendi1!=WALL) tempDir=(dir+1)%4;
           else tempDir=(dir-1+4)%4;
         }else{ //goes front
         }
       }
       dir=tempDir;
     }
     chaseHero();
     move(dir);
   }
   int cellType(int dir){ 
      if (dir==0) return grid[curCol][curRow-1].type;//(curCol,curRow-1); //up cell
     else if(dir==2) return grid[curCol][curRow+1].type;//(curCol,curRow+1); //down cell
     else if (dir==1) return grid[curCol+1][curRow].type;//(curCol+1,curRow); //right cell
     else return grid[curCol-1][curRow].type;//(curCol-1,curRow); //left cell
   }
   void move(int dir){
     if(dir==0) curRow-=1;
     else if (dir==2) curRow+=1;
     else if (dir==1) curCol+=1;
     else curCol-=1;
   }
   void chaseHero(){
     boolean dirChanged = false;
     //check top column of cells
     int tempCol=curCol; int tempRow=curRow;
     while(grid[tempCol][tempRow-1].type!=WALL){
       tempRow-=1;
       if(isHeroCell(tempCol,tempRow)){
         dir=0;
         dirChanged =true;
       }
     }
     //check bottom column of cells
     if(dirChanged==false){
       tempCol=curCol;  tempRow=curRow;
       while(grid[tempCol][tempRow+1].type!=WALL){
         tempRow+=1;
         if(isHeroCell(tempCol,tempRow)){
           dir=2;
           dirChanged = true;
         }
       }
     }
     //check right row of cells
     if(dirChanged==false){
       tempCol=curCol;  tempRow=curRow;
       while(grid[tempCol+1][tempRow].type!=WALL){
         tempCol+=1;
         if(isHeroCell(tempCol,tempRow)){
           dir=1;
           dirChanged = true;
         }
       }
     }
     //check left row of cells
     if(dirChanged==false){
       tempCol=curCol;  tempRow=curRow;
       while(grid[tempCol-1][tempRow].type!=WALL){
         tempCol-=1;
         if(isHeroCell(tempCol,tempRow)){
           dir=3;
           dirChanged = true;
         }
       }
     }
   }
   int randomDirection(){
     int tempDir=0;
     do{
         tempDir=((int)random(1,100))%4;
       }while(cellType(tempDir)==WALL);
     return tempDir;
   }
}

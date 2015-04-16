class Hero{
  int curCol, curRow;
   int state=0; //0=at rest 1=in motion
  int dir=0;
  Hero(int col, int row){
    curCol = col;
    curRow = row;
  }
  
  String Update(){
    //user ai goes here. This function will be called once for every move/iteration.
    //Return "UP", "DOWN", "LEFT" or "RIGHT" to indicate which direction you want to move on the board for the current iteration.
    // getCellType(col,row) function returns an int which is the type of the cell at given col,row position on board.Range: 0<=col<30 and 0<=row<30
    //cell types (with int values) are EMPTY = 0, HERO = 1, GHOST=2, FOOD = 3, GEM = 4 and WALL = 5  
    //int then = millis();
    //int TypeOfCellToTheRightOfHero = getCellType(curCol+1,curRow);
    
    //int[][] ghostPositions = getGhostPositions(); 
    //getGhostPositions() returns a 4x2 array with index 0 having col number and index 1 having row number of the 4 ghosts
    //Eg: ghostPositions[0][0] represents col number of first ghost. ghostPositions[3][1] represents row number of fourth ghost  
    
    //note: if you land on a cell with Gem ( green diamond ), all ghosts freeze for 20 moves. Its your chance to escape from surrounding ghosts or collect more food. :)
    // if you collide with wall/ghost, game is over.
        
    //return "RIGHT";
    if(state==0){
       state=1;
       dir=randomDirection();
     }
     else{
       println("In dir:"+dir);
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
    // chaseHero();
    println("Out dir:"+dir);
     return move(dir);
  }
  
  //you can write your own functions/variables here which can be used inside Update()
  int cellType(int dir){ 
      if (dir==0) return grid[curCol][curRow-1].type;//(curCol,curRow-1); //up cell
     else if(dir==2) return grid[curCol][curRow+1].type;//(curCol,curRow+1); //down cell
     else if (dir==1) return grid[curCol+1][curRow].type;//(curCol+1,curRow); //right cell
     else return grid[curCol-1][curRow].type;//(curCol-1,curRow); //left cell
   }
   String move(int dir){
     if(dir==0) return "UP";
     else if (dir==2) return "DOWN";
     else if (dir==1) return "RIGHT";
     else return "LEFT";
   }
   int randomDirection(){
     int tempDir=0;
     do{
         tempDir=((int)random(1,100))%4;
       }while(cellType(tempDir)==WALL);
     return tempDir;
   }
}

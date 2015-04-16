# GHOSTS

A Pac-man simulation/game where the user needs to code the AI for the hero.

The aim is to guide the hero (orange square) to take all the food (orange dots) without dashing on the ghosts (white squares). 
Blue squares are the walls and the green gems are used to freeze the ghosts for few seconds using which the hero can escape if 
he is surrounded by ghosts or gather more food!

![My image](https://thebluebreeze.files.wordpress.com/2015/04/capture.png)

## Instructions:
Write the AI for the hero in Update() in Hero.pde file.

Simple food grabbing code for the hero has already been written just to get an easy grasp.

Try writing a better AI! :)

##Note:
Ghosts roam around the board. If the Hero comes in the line of sight of a Ghost, Hero will be chased until the hero disappears from line of sight.

Line of sight of a Ghost is all four directions till hit by wall. In below pic, thick orange lines represent the line of sight of respective ghosts.

![My image](https://thebluebreeze.files.wordpress.com/2015/04/capture_los.png)

As the Hero moves over the cells with food, food will be collected automaticallly. 

If Hero moves over a cell with gem, all the ghosts freeze for 20 moves. 

If Hero moves over a cell with wall or a ghost game is over.

There are 400 FOOD in the board. Collect as many food as you can in lesser number of moves without hitting walls or ghosts.


Created using Processing (https://processing.org/)

If bugs are found report at bhuvanesh.bleu@gmail.com

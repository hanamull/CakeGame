void keyPressed(){
  if(key == 'a'){
    isWalking = !isWalking;
    x = x-6;
    if(isWalking){
      character = loadImage(skibidi+"0h.png");
    }else{
      character = loadImage(skibidi+"1h.png");
    }
  }
 
  if(key == 'w'){
    if(jumps>=1){
      velocityY = -10;
      jumps = 0;
    }
  }
  if(key == 'd'){
    isWalking = !isWalking;
    x = x+6;
    if(isWalking){
      character = loadImage(skibidi+"0.png");
    }else{
      character = loadImage(skibidi + "1.png");
    }
  }
  if(key == ' ' && dialogueShows){
    talking = !talking;
    dialogueCounter = dialogueCounter + 1;
  }
}

PImage character;
PImage playButton;
PImage charButton;
PImage settingButton;
PImage box;
PImage cloud;
PImage finishButton;

color back = color(157,193,131);

boolean isWalking = false;
boolean isJumping = false;
boolean mouseClick = false;
boolean stayInBounds = false;
boolean screen2 = false;
boolean buttonsActive = true;
boolean characterShows = false;
boolean flavorChange = false;
boolean numChange = true;
boolean showsCakes = false;
boolean dialogueShows = false;
boolean talking = false;
boolean cakeCanTouch = false;
boolean cakeShows = false;
boolean endDialogue = false;
boolean finishOpen = false;
boolean finished = false;
boolean dialogueEnds = false;

int buttonsX = 100;
int buttonsY = -200;
int boxX = -200;
int boxY = 0;
int cloudX = -500;
int cloudY = 0;
int ground = 350;
int x,y;
float velocityY, acceleration;
int jumps = 1;
int levelCount = 1;
int customerCountdown = 60;
int num = 0;
int dialogueCounter = 0;

int[] boxCoords = {boxX, boxY};
int[] guyCoords = {x, y};
String skibidi = "Hana";
String flavor = "cloudburst";
String requestedFlavor = "vanillaCake";
String requestedFrost = "chocolateFrosting";
String requestedTopping = "strawberries";
String skibiflav = "defaultCake";
String skibicake = "defaultCake";
String skibitop = "defaultCake";

void setup(){
  size(400,600);
  acceleration = 0.75;
  velocityY = 0;
  background = loadImage("background.png");
  character = loadImage(skibidi+"0.png");
  x = 150;
  y = 350;
  playButton = loadImage("playbutton.png");
  charButton = loadImage("charbutton.png");
  settingButton = loadImage("settingbutton.png");
  box = loadImage("counter.png");
  cloud = loadImage("cloud.png");
  button1 = loadImage("Oscar1.png");
  button2 = loadImage("Hana1.png");
  button3 = loadImage("Conrad1.png");
  button4 = loadImage("Emery1.png");
  button5 = loadImage("Ryn1.png");
  button6 = loadImage("Hashagen1.png");
  charTitle = loadImage("chartitle.png");
  customer = loadImage(flavor+"cakemonster" + num + ".png");
  dialogueBox = loadImage("dialogueBox.png");
  dialogue = loadImage("vanDialogue1.png");
  cake = loadImage(skibicake + ".png");
  frosting = loadImage(skibiflav + ".png");
  toppings = loadImage(skibitop + ".png");
  finishButton = loadImage("finishedButton.png");
}
void draw(){
  if(stayInBounds == true && x>=60){
    x = 60;
  }else if(stayInBounds == true && x<=0){
    x = 0;
  }
  background(back); 
  if(showsCakes){
    image(background,0,0);
  }
  y += velocityY;
  if(y>=350){
    jumps = 1;
    y = 350;
  }
  image(character, x, y);
  if(screen2 == false){
    image(playButton, 50, 500);
    image(settingButton, 165, 500);
    image(charButton, 280, 500);
  }
  box.resize(120,25);
  dialogueBox.resize(350,150);
  image(box, boxX, boxY);
  cloud.resize(160,25);
  image(cloud, cloudX, cloudY);
  image(button1, buttonsX, buttonsY);
  image(button2, buttonsX+65, buttonsY);
  image(button3, buttonsX+130, buttonsY);
  image(button4, buttonsX, buttonsY+70);
  image(button5, buttonsX+65, buttonsY+70);
  image(button6, buttonsX+130, buttonsY+70);
  image(charTitle, buttonsX-50, buttonsY+70);
  if(skibicake == "vanillaCake" && skibitop == "strawberries" && skibiflav == "chocofrost"){
    dialogue = loadImage("dialogueEnd.png");
  }
  if(cakeShows){
    image(cake,20,363);
    image(frosting,20,363);
    image(toppings,20,363);
    customer.resize(65,65);
  }
  dialogue.resize(300,200);
  if(characterShows){
    image(customer,150,350);
  }
  if(dialogueShows){
    image(dialogueBox, 25,410);
  }
  if(flavorChange){
    customer = loadImage(flavor + "cakemonster" + num + ".png");
    flavor = "vanilla";
    num = 1;
  }
  if(numChange == false){
    num = 0;
  }
  if(screen2){
    cakeShows = true;
    buttonsActive = false;
    customerCountdown = customerCountdown -1;
    showsCakes = true;
  }
  if(customerCountdown==0){
    characterShows = true;
  }
  if(customerCountdown == -30){
    flavorChange = true;
  }
  if(customerCountdown == -60){
    numChange = false;
  }
  if(customerCountdown == -80){
    dialogueShows = true;
  }
  if(talking){
    num = 1;
  }
  if(dialogueCounter == 1){
    image(dialogue, 60,410);
  }
  if(dialogueCounter == 2){
    dialogue = loadImage("charDialogue1.png");
    dialogue.resize(300,200);
    image(dialogue,50,410);
  }
  if(dialogueCounter>=3){
    cakeCanTouch = true;
    dialogueEnds = true;
  }
  if(dialogueEnds && !skibicake.equals("defaultCake") && !skibitop.equals("defaultCake") && !skibiflav.equals("defaultCake")){
    finishButton.resize(50,50);
    image(finishButton, 100,300);
    finishOpen = true;
  }
  if(finished && skibicake.equals(requestedFlavor)&& skibitop.equals(requestedTopping)&& skibiflav.equals(requestedFrost)){
    dialogue = loadImage("dialogueEnd.png");
    dialogue.resize(300,200);
    image(dialogue, 60, 410);
  }else if(finished){
    dialogue = loadImage("dialogueBAD.png");
    dialogue.resize(300,200);
    image(dialogue, 60, 410);
  }
  velocityY += acceleration;
}
boolean pointRect(){
  if(buttonsActive){
    boolean inRectangle = false;
    if(50 < mouseX && mouseX < 120 && 500 < mouseY && mouseY < 570){
      inRectangle = true; 
    }
    return inRectangle;
  }
  return false;
}
boolean charBut(){
  if(buttonsActive){
    boolean inChar = false;
    if(280< mouseX && mouseX< 350 && 500<mouseY&&mouseY<570){
      inChar = true;
    }
  return inChar;
  }
  return false;
}
String awesomeCharacters(){
  if(buttonsX< mouseX && mouseX< buttonsX+50 && buttonsY<mouseY&&mouseY<buttonsY+70){
    return "Oscar";
  }else if(buttonsX+65< mouseX && mouseX< buttonsX+115 && buttonsY<mouseY&&mouseY<buttonsY+70){
    return "Hana";
  }else if(buttonsX+130< mouseX && mouseX< buttonsX+180 && buttonsY<mouseY&&mouseY<buttonsY+70){
    return "Conrad";
  }else if(buttonsX< mouseX && mouseX< buttonsX+50 && buttonsY<mouseY&&mouseY<buttonsY+140){
    return "Emery";
  }else if(buttonsX+65< mouseX && mouseX< buttonsX+115 && buttonsY<mouseY&&mouseY<buttonsY+140){
    return "Ryn";
  }else if(buttonsX+130< mouseX && mouseX< buttonsX+180 && buttonsY<mouseY&&mouseY<buttonsY+140){
    return "Hashagen";
  }
  return skibidi;
}
void mouseClicked(){
  if(cakeShows){
    if(60<mouseX && mouseX<130 && 80 < mouseY && mouseY< 120){
       skibicake = "vanillaCake";
       cake = loadImage(skibicake + ".png");
    }else if(165<mouseX && mouseX<220 && 80 <mouseY && mouseY< 120){
       skibicake = "matchaCake";
       cake = loadImage(skibicake + ".png");
    }else if(290<mouseX && mouseX<340 && 80 <mouseY && mouseY< 120){
       skibicake = "chocolateCake";
       cake = loadImage(skibicake + ".png");
    }else if(60<mouseX && mouseX<130 && 138 <mouseY && mouseY< 150){
       skibiflav = "strawberryFrosting";
       frosting = loadImage(skibiflav + ".png");
    }else if(165<mouseX && mouseX<220 && 138 <mouseY && mouseY< 150){
       skibiflav = "chocolateFrosting";
       frosting = loadImage(skibiflav + ".png");
    }else if(290<mouseX && mouseX<340 && 138 <mouseY && mouseY< 150){
       skibiflav = "vanillaFrosting";
       frosting = loadImage(skibiflav + ".png");
    }else if(50<mouseX && mouseX<100 && 240 <mouseY && mouseY< 270){
       skibitop = "strawberries";
       toppings = loadImage(skibitop + ".png");
    }else if(120<mouseX && mouseX<170 && 240 <mouseY && mouseY< 270){
       skibitop = "rainbowSprinkles";
       toppings = loadImage(skibitop + ".png");
    }else if(178<mouseX && mouseX<210 && 240 <mouseY && mouseY< 270){
       skibitop = "chocolateBoard";
       toppings = loadImage(skibitop + ".png");
    }
  }
  boolean real = pointRect();
  if(real == true){
    screen2 = true;
    back = color(230,200,240);
    boxX = 0;
    boxY = 390;
    cloudX = 50;
    cloudY = 270;
    buttonsX = 150;
    buttonsY = -200;
    x=50;
    stayInBounds = true;
  }
  boolean charClicked = charBut();
  if(charClicked == true){
    mouseClick = true;
    real = false;
    back = color(255,192,203);
    boxX = -300;
    boxY = 350;
    cloudX = -550;
    cloudY = 270;
    buttonsX = 100;
    buttonsY = 60;
    x=150;
    stayInBounds = false;
  }
  if(finishOpen){
    if(100<mouseX && mouseX<150 && 300 <mouseY && mouseY< 350){
      finished = true;
    }
  }
  String newImage = awesomeCharacters();
  character = loadImage(newImage +"0.png");
  skibidi = newImage;
}

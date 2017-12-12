//Author: Stephen Alger C16377163
//Title: Martian UI (mOS BETA)
//Version: BETA C1

//Global Variables:
ArrayList<MenuItem> menuitems = new ArrayList<MenuItem>(); 
ArrayList<HomeBG> backgrounds = new ArrayList<HomeBG>(); 
//ArrayList<MartianVars> marsfacts = new ArrayList<MartianVars>(1); 

//Control user's passage...
int state=-1;

//font setup
PFont martianFont;
PFont martianFontBold;
PFont martianFontBlock;
int bigSize = 48;
int titleSize=32;
int bodySize=18;
int smallSize=14;

//fade content in via a dynamic alpha gradient in every fill() method call
int alpha = 1, delta = 1; 

Table table;
float InitialAngle = 0;

float buttonWidth;
float buttonHeight;

void setup()
{
  //fullScreen();
  size(1200,700);
  frameRate(30);
  loadData();
  //loadMarsData();

  for (int i=0; i<5; i++)
  {
    HomeBG Background = new HomeBG(); 
    backgrounds.add(Background);
  }
  
  //load multiple images
  backgrounds.get(0).filename="home.jpg";
  backgrounds.get(0).BG = loadImage(backgrounds.get(0).filename);
  
  backgrounds.get(1).filename="mission.jpeg";
  backgrounds.get(1).BG = loadImage(backgrounds.get(1).filename);
  
  backgrounds.get(2).filename="astro.jpg";
  backgrounds.get(2).BG = loadImage(backgrounds.get(2).filename);
  
  backgrounds.get(3).filename="mars.jpg";
  backgrounds.get(3).BG = loadImage(backgrounds.get(3).filename);
  
  backgrounds.get(4).filename="space.jpeg";
  backgrounds.get(4).BG = loadImage(backgrounds.get(4).filename);
  
  martianFont = createFont("Gridnik", titleSize);
  martianFontBold = createFont("GridnikBold.otf", titleSize);
  martianFontBlock = createFont("Impact.ttf", titleSize);
  
  
}//end setup



void draw()
{ //<>//
  
  
  //dashboard
  if (state ==-1)
  {
    image(backgrounds.get(0).BG,backgrounds.get(0).posTracker.x,backgrounds.get(0).posTracker.y,width, height);
    drawMenu();
    drawBarsNdStaticMenu();
    fade(); 
  }
  //mission status
  else if (state==0)
  {
    
    image(backgrounds.get(1).BG,backgrounds.get(1).posTracker.x,backgrounds.get(1).posTracker.y,width, height);
  
    drawBarsNdStaticMenu();
    mission();
    fade(); 
    home();
  }
  
  //astronaut
  else if (state==1)
  {
    image(backgrounds.get(2).BG,backgrounds.get(2).posTracker.x,backgrounds.get(2).posTracker.y,width, height);
    drawBarsNdStaticMenu();
    fade(); 
    home();
  }
  
  //mars variables
  else if (state==2)
  {
    image(backgrounds.get(3).BG,backgrounds.get(3).posTracker.x,backgrounds.get(3).posTracker.y,width, height);
    drawBarsNdStaticMenu();
    fade(); 
    home();
    //marsVariables();
  }
  
  //spaceship sitrep
  else if (state==3)
  {
    image(backgrounds.get(4).BG,backgrounds.get(4).posTracker.x,backgrounds.get(4).posTracker.y,width, height);
    drawBarsNdStaticMenu();
    fade(); 
    home();
  }
}//end draw

void drawMenu()
{
  
  float boxStartX = width*.65;
  float boxStartY = height*0.2;
  
  float boxWidth = width*.20;
  float boxHeight = height*0.8;
  
  buttonWidth = boxWidth;
  buttonHeight = boxHeight/(menuitems.size()*2);
  noFill();
  //rect(boxStartX, boxStartY, boxWidth, boxHeight);
  textAlign(RIGHT, CENTER);

  float gapY = boxHeight/(menuitems.size()*2);
  
  for (int i = 0; i<menuitems.size(); i++)
  {
    textFont(martianFontBlock);
    fill(255,255,255,alpha);
    textSize(bodySize);
    
    text(menuitems.get(i).Name, boxStartX+buttonWidth , boxStartY+ (buttonHeight/2));
    textFont(martianFont);
    textSize(titleSize*.85);
    switch(i)
    {
      case 0: 
              text("Status", boxStartX+buttonWidth , (boxStartY+(buttonHeight/2))+titleSize);
              break;
      case 1:
              text("Updates", boxStartX+buttonWidth , (boxStartY+(buttonHeight/2))+titleSize);
              break;
      
      case 2: 
              text("Variables", boxStartX+buttonWidth , (boxStartY+(buttonHeight/2))+titleSize);
              break;
      
      case 3: 
              text("SITREP", boxStartX+buttonWidth , (boxStartY+(buttonHeight/2))+titleSize);
              break;
    }
        
    //save button hotspots for button hovering/clicking
    menuitems.get(i).buttonStart.x = boxStartX;
    menuitems.get(i).buttonStart.y = boxStartY;
    boxStartY += gapY ;

   }//end for
}//end function()

void mousePressed()
{
  println(buttonWidth);
  println(buttonHeight);
  if (mouseX>  (width/2)-100 && mouseX<(width/2)+100
  && mouseY>(height*.1+bigSize)-100 && mouseY<(height*.1+bigSize)+100)
  {
    state=-1;
  }
  
  //deal with button clicks 
  for(int i=0; i<menuitems.size(); i++)
  {
    if(mouseX>menuitems.get(i).buttonStart.x && mouseX<menuitems.get(i).buttonStart.x + buttonWidth 
    && mouseY>menuitems.get(i).buttonStart.y && mouseY<menuitems.get(i).buttonStart.y + buttonHeight)
    {
        state=i;
        
    }//end if
  }//end for
}

//Method: loadData()
//Function: Create table & input CSV data into Table.
void loadData()
{

  table = loadTable("menu.csv", "header");
  
  for (TableRow row : table.rows()) 
  {
  
      //declare instance of object MenuItem & carry out constructor
      MenuItem menuitem = new MenuItem(row);
      menuitems.add(menuitem);
    
  }
  
  for(MenuItem menuitem:menuitems)
  {
    println(menuitem);
  }//end for

}//end loadData()

void drawBarsNdStaticMenu()
{
  float insetX = width*.05;
  float insetY = height*.1;
  float yCounter=275;
  
  stroke(255,255,255,alpha);
  strokeWeight(2.5);
  strokeCap(ROUND);
  line(insetX, insetY, (insetX), (height-insetY));
  
  line((width-insetX), insetY, (width-insetX), (height-insetY));
  
  textAlign(LEFT, CENTER);
  textFont(martianFont);
  
  fill(255,255,255,alpha);
  text("MISSION DAY", width/8, insetY+bigSize);
  textFont(martianFontBold);
  text("SOL: 22", (width/8), insetY*2);
  PVector wheelCords = new PVector((width/8)*2.25, insetY*2);
  loadWheel(wheelCords);
  

  noFill();
  stroke(255);
  
  fill(255,255,255,alpha);
  textFont(martianFontBold);
  textSize(smallSize);
  text("PRESSURE", width/8, yCounter);
  fill(255,255,255,alpha);
  textFont(martianFont);
  textSize(bigSize);
  yCounter+=bigSize;
  text("14.56psi", (width/8), yCounter);
  yCounter+=bigSize;
  
  fill(255,255,255,alpha);
  textFont(martianFontBold);
  textSize(smallSize);
  text("OXYGEN", width/8, yCounter);
  fill(255,255,255,alpha);
  textFont(martianFont);
  textSize(bigSize);
  yCounter+=bigSize;
  text("30.52%", (width/8), yCounter);
  
  fill(255,255,255,alpha);
  textFont(martianFontBold);
  textSize(smallSize);
  yCounter+=bigSize;
  text("ENVIRONMENT", width/8, yCounter);
  fill(255,255,255,alpha);
  textFont(martianFont);
  textSize(bigSize);
  yCounter+=bigSize;
  text("52.11c", (width/8), yCounter);
  
  textAlign(RIGHT);
  
  fill(255,255,255,alpha);
  textFont(martianFontBold);
  textSize(smallSize);
  text("TIME", (width-insetX)-200, insetY+titleSize);
  fill(255,255,255,alpha);
  text(time(), (width-insetX)-120, insetY+titleSize);
  
  fill(255,255,255,alpha);
  textFont(martianFontBold);
  textSize(smallSize);
  text("LOG ENTRY", (width-insetX)-210, insetY+(titleSize*1.5));
  fill(255,255,255,alpha);
  text("WATNEY #8", (width-insetX)-120, insetY+(titleSize*1.5));
  
  textAlign(LEFT);
  fill(255,255,255,alpha);
  textFont(martianFontBlock);
  textSize(bigSize);
  text("HAB", width/8, 600);
  fill(255,255,255,alpha);
  textFont(martianFontBold);
  textSize(60);
  text("TERMINAL", width/8+100, 600);
 
  
  int[] randnum = new int[10];
  for (int i=0; i<10; i++)
  {
    randnum[i] = (int)random(0x0, 0xFFFFFFF);
  }
  
  textAlign(LEFT);
  fill(255,255,255,alpha);
  textFont(martianFontBlock);
  textSize(smallSize);

  text("CONNECTED: "+"XX-"+hex(randnum[(int)random(0,9)])+"-MM"+hex(randnum[(int)random(0,9)])+"-K2"+hex(randnum[(int)random(0,9)]), width/8, 620);


} //end drawBarsNdStaticMenu()

String time()
{
  int hour = hour();
  int min = minute();
  String correctMinute = (min<10)? ("0" + str(min)): str(min);
  String time = (hour+":"+correctMinute+"AM");
  return time;
  
}

void loadWheel(PVector Cords)
{
  pushMatrix();
  translate(Cords.x,Cords.y); 
  
  rotate(InitialAngle);
  //translate(OrbitRadius, 0);
  noFill();
  stroke(255,255,255,alpha);
  strokeWeight(3);
  arc(0, 0, 30, 30, PI, PI+QUARTER_PI);
  arc(0, 0, 30, 30, HALF_PI, HALF_PI+QUARTER_PI);
  arc(0, 0, 30, 30, 0, 0+QUARTER_PI);
  arc(0, 0, 30, 30, (3*PI)/2, (3*PI)/2+QUARTER_PI);
  InitialAngle += 0.1;
  popMatrix();
}



void fade() { 
  //fade in
  
  if (alpha <255)
  {
    alpha += 3; 
  }
  
} //end fade

void home()
{
  fill(255,255,255,alpha);
  textSize(bodySize);
  textAlign(CENTER);
  textFont(martianFontBold);
  text("Dashboard", width/2,height*.1+bigSize);
}

void mission()
{
  float boxStartX = width*.65;
  float boxStartY = height*0.2;
  
  float boxWidth = width*.20;
  float boxHeight = height*0.8;
  
  buttonWidth = boxWidth;
  buttonHeight = boxHeight/(menuitems.size()*2);
  float gapY = boxHeight/(menuitems.size()*2);
  
  textAlign(RIGHT, CENTER);
  textFont(martianFontBlock);
  fill(255,255,255,alpha);
  textSize(bodySize);
  text("Mission Brief:",boxStartX+buttonWidth, boxStartY+ (buttonHeight/2));
  boxStartY += gapY ;
  textFont(martianFont);
  textSize(titleSize*.5);
  text("<----SAVE MARK WATNEY!",boxStartX+buttonWidth, boxStartY+ (buttonHeight/2));
  
 
}//end mission()

//void marsVariables()
//{

  
//}//end marsVariables()

//void loadMarsData()
//{

//  table = loadTable("mars_factsheet.csv", "header");
  
//  for (TableRow row : table.rows()) 
//  {
  
//      //declare instance of object MenuItem & carry out constructor
//      MartianVars Facts = new MartianVars(row);
//      marsfacts.add(Facts);
    
//  }
  

//}//end loadData()
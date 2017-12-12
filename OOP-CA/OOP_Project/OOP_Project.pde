//Author: Stephen Alger C16377163
//Title: Martian UI (mOS BETA)
//Version: BETA C1

//Global Variables:
ArrayList<MenuItem> menuitems = new ArrayList<MenuItem>(); 
HomeBG Background = new HomeBG(); 

//font setup
PFont martianFont;
PFont martianFontBold;
PFont martianFontBlock;
int titleSize=32;
int bodySize=18;
float insetX;
float insetY;

Table table;
float InitialAngle = 0;

void setup()
{
  //fullScreen();
  size(1200,700);
  frameRate(120);
  loadData();

  
  Background.filename = "default1.jpg";
  Background.BG = loadImage(Background.filename);
  martianFont = createFont("Gridnik", titleSize);
  martianFontBold = createFont("GridnikBold.otf", titleSize);
  martianFontBlock = createFont("Impact.ttf", titleSize);
  
   
  
}



void draw()
{
  //ButtonPane Container = new ButtonPane(); 
  
  image(Background.BG,Background.posTracker.x,Background.posTracker.y,width, height);
  drawMenu();
  drawBarsNdStaticMenu();
  Hoverchecker();

}

void drawMenu()
{
  
  Button MenuButton = new Button();
  
  for (int i = 0; i<MenuButton.numButtons; i++)
  {

    rect(MenuButton.buttonStart.x, MenuButton.buttonStart.y-titleSize, MenuButton.buttonWidth, MenuButton.buttonHeight);
    textAlign(RIGHT, CENTER);
    
  
    textFont(martianFontBold);
    textSize(titleSize*.8);
    fill(255);
    text(menuitems.get(i).name, MenuButton.buttonStart.x + MenuButton.buttonWidth, MenuButton.buttonStart.y);
    
    //save button hotspots for button hovering/clicking
    menuitems.get(i).startMenuItem.x = MenuButton.buttonStart.x;
    menuitems.get(i).startMenuItem.y = MenuButton.buttonStart.y-titleSize;
    menuitems.get(i).itemWidth = MenuButton.buttonWidth;
    menuitems.get(i).itemHeight = MenuButton.buttonHeight;
    
    MenuButton.buttonStart.y +=  MenuButton.gapY;
    
    
    
   }
}

void mouseClicked()
{
  //deal with button clicks 
}

//Method: loadData()
//Function: Create table & input CSV data into Table.
void loadData()
{

table = loadTable("menu1.csv", "header");

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
  insetX = width*.05;
  insetY = height*.1;
  
  stroke(255);
  strokeWeight(2.5);
  strokeCap(ROUND);
  line(insetX, insetY, (insetX), (height-insetY));
  
  line((width-insetX), insetY, (width-insetX), (height-insetY));
  
  textAlign(LEFT, CENTER);
  textFont(martianFont);
  
  fill(255);
  text("MISSION DAY", width/8, insetY+titleSize);
  textFont(martianFontBold);
  text("SOL: 22", (width/8), insetY*2);
  PVector wheelCords = new PVector((width/8)*2.25, insetY*2);
  loadWheel(wheelCords);
  

  noFill();
  stroke(255);
  
  fill(255,255,255,200);
  textFont(martianFontBold);
  textSize(14);
  text("PRESSURE", width/8, 275);
  fill(255,255,255);
  textFont(martianFont);
  textSize(48);
  text("14.56psi", (width/8), 315);
  
  
  fill(255,255,255,200);
  textFont(martianFontBold);
  textSize(14);
  text("OXYGEN", width/8, 375);
  fill(255,255,255);
  textFont(martianFont);
  textSize(48);
  text("30.52%", (width/8), 415);
  
  fill(255,255,255,200);
  textFont(martianFontBold);
  textSize(14);
  text("ENVIRONMENT", width/8, 475);
  fill(255,255,255);
  textFont(martianFont);
  textSize(48);
  text("52.11c", (width/8), 515);
  
  textAlign(RIGHT);
  
  fill(255,255,255,100);
  textFont(martianFontBold);
  textSize(14);
  text("TIME", (width-insetX)-200, insetY+titleSize);
  fill(255,255,255);
  text(time(), (width-insetX)-120, insetY+titleSize);
  
  fill(255,255,255,100);
  textFont(martianFontBold);
  textSize(14);
  text("LOG ENTRY", (width-insetX)-210, insetY+(titleSize*1.5));
  fill(255,255,255);
  text("WATNEY #8", (width-insetX)-120, insetY+(titleSize*1.5));
  
  textAlign(LEFT);
  fill(255,255,255);
  textFont(martianFontBlock);
  textSize(48);
  text("HAB", width/8, 600);
  fill(255,255,255,150);
  textFont(martianFontBold);
  textSize(60);
  text("TERMINAL", width/8+100, 600);
 
  
  int randnum = (int)random(0x0, 0xFFFFFFF);
  
  textAlign(LEFT);
  fill(255,255,255);
  textFont(martianFontBlock);
  textSize(14);
  text("CONNECTED: "+"XX-"+hex(randnum)+"-MM"+hex(randnum)+"-K2"+hex(randnum), width/8, 620);
  

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
  stroke(255,255,255,200);
  strokeWeight(3);
  arc(0, 0, 30, 30, PI, PI+QUARTER_PI);
  arc(0, 0, 30, 30, HALF_PI, HALF_PI+QUARTER_PI);
  arc(0, 0, 30, 30, 0, 0+QUARTER_PI);
  arc(0, 0, 30, 30, (3*PI)/2, (3*PI)/2+QUARTER_PI);
  InitialAngle += 0.1;
  popMatrix();
}

void Hoverchecker()
{
  for(int i=0; i<menuitems.size(); i++)
  {
    if(mouseX>menuitems.get(i).startMenuItem.x && mouseX<menuitems.get(i).startMenuItem.x + menuitems.get(i).itemWidth 
    && mouseY>menuitems.get(i).startMenuItem.y && mouseY<menuitems.get(i).startMenuItem.y+menuitems.get(i).itemHeight)
    {
        fill(255,0,0,60);
        stroke(0);
        frameRate(10); //specifies that 10 frames are to be drawn per second - to help illustrate button press to user
      
        //give user feedback on button press - glow the selected button red on click
        rect(menuitems.get(i).startMenuItem.x,menuitems.get(i).startMenuItem.y, menuitems.get(i).itemWidth , menuitems.get(i).itemHeight );
    }//end if
  }//end for
}//end function()
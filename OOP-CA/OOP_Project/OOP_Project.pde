//Author: Stephen Alger C16377163
//Title: Martian UI (mOS BETA)
//Version: BETA C1

//Global Variables:
ArrayList<MenuItem> menuitems = new ArrayList<MenuItem>(); 
HomeBG Background = new HomeBG(); 

//font setup
PFont martianFont;
PFont martianFontBold;

Table table;

void setup()
{
  //fullScreen();
  size(1200,700);
  loadData();

  //Background.posTracker = new PVector(0, 0);
  Background.filename = "default.jpg";
  Background.BG = loadImage(Background.filename);
  martianFont = createFont("Gridnik", 32);
  martianFontBold = createFont("GridnikBold.otf", 32);
  
   
  
}



void draw()
{
  //ButtonPane Container = new ButtonPane(); 
  
  stroke(0);
  background(0);
  image(Background.BG,Background.posTracker.x,Background.posTracker.y);
  //image(Background.BG, 0, 0, width, height);
  
  textAlign(CENTER, CENTER);
  textFont(martianFontBold);
  fill(255);
  text("mOS BETA - Martian UI", width/2, height/12);
  
  noFill();
  stroke(255);
  //rect(Container.posTracker.x, Container.posTracker.y, Container.paneWidth, Container.paneHeight);
  
  drawMenu();
  
}

void drawMenu()
{
  
  Button MenuButton = new Button();
  
  for (int i = 0; i<MenuButton.numButtons; i++)
  {
    fill(0,0,128,0.5);
    stroke(128);

    rect(MenuButton.buttonStart.x, MenuButton.buttonStart.y, MenuButton.buttonWidth, MenuButton.buttonHeight, 3, 6, 12, 18 );
    textAlign(CENTER, CENTER);
    
    textFont(martianFontBold);
    textSize(18);
    fill(255);
    text(menuitems.get(i).name, MenuButton.buttonStart.x + (MenuButton.buttonWidth/2), MenuButton.buttonStart.y + (MenuButton.buttonHeight/2));
    
    //save button hotspots
    menuitems.get(i).startMenuItem.x = MenuButton.buttonStart.x;
    menuitems.get(i).startMenuItem.y = MenuButton.buttonStart.y;
    
    fill(255);
    ellipse(menuitems.get(i).startMenuItem.x, menuitems.get(i).startMenuItem.y, 55, 55);
    
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
//Author: Stephen Alger C16377163
//Title: Martian UI (mOS BETA)
//Version: BETA C1

//Global Variables:
ArrayList<MenuItem> menuitems = new ArrayList<MenuItem>(); 
HomeBG Background = new HomeBG(); 

//font setup
PFont myFont;


Table table;

void setup()
{
  //fullScreen();
  size(1200,700);
  loadData();

  //Background.posTracker = new PVector(0, 0);
  Background.filename = "/Users/Stephen/Desktop/SCI-FI-UI/OOP-CA/OOP_Project/data/default.jpg";
  Background.BG = loadImage(Background.filename);
  myFont = createFont("Gridnik", 32);
  
  
   //table = loadTable("menu1.csv", "header");
   //println(table.getRowCount() + " total rows in table");
   
  
}



void draw()
{
  ButtonPane Container = new ButtonPane(); 
  
  stroke(0);
  background(0);
  image(Background.BG,Background.posTracker.x,Background.posTracker.y);
  //image(Background.BG, 0, 0, width, height);
  
  textAlign(CENTER, CENTER);
  //textSize(relativeTitleTextSize);
  textFont(myFont);
  fill(255);
  text("mOS BETA - Martian UI", width/2, height/12);
  
  noFill();
  stroke(255);
  rect(Container.posTracker.x, Container.posTracker.y, Container.paneWidth, Container.paneHeight);
  
  drawMenu();
  
}

void drawMenu()
{
  
  Button MenuButton = new Button();
  
  for (int i = 0; i<MenuButton.numButtons; i++)
  {
    fill(0,0,255);
    stroke(128);

    rect(MenuButton.buttonStart.x, MenuButton.buttonStart.y, MenuButton.buttonWidth, MenuButton.buttonHeight, 3, 6, 12, 18 );
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
String name;
table = loadTable("menu1.csv", "header");

for (TableRow row : table.rows()) 
{
    
  
    //declare instance of object MenuItem & carry out constructor
    MenuItem menuitem = new MenuItem(row);
    name = row.getString("Name");
    menuitem.name = name;
    menuitems.add(menuitem);
  
}

  for(MenuItem menuitem:menuitem)
  {
    println(product);
  }//end for

}//end loadData()
//Author: Stephen Alger C16377163
//Title: Martian UI (mOS BETA)
//Version: BETA C1

//Global Variables:
HomeBG Background = new HomeBG(); 



void setup()
{
  size(1200, 700);

  //Background.posTracker = new PVector(0, 0);
  Background.filename = "/Users/Stephen/Desktop/SCI-FI-UI/OOP-CA/OOP_Project/data/default.jpg";
  Background.BG = loadImage(Background.filename);
  
}

void draw()
{
  stroke(0);
  background(0);
  image(Background.BG,Background.posTracker.x,Background.posTracker.y);
  //image(Background.BG, 0, 0, width, height);
  
  textAlign(CENTER, CENTER);
  //textSize(relativeTitleTextSize);
  text("mOS BETA - Martian UI", width/2, height/12);
  
  
}
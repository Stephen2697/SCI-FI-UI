//Encapsulation Procedure:
class HomeBG
{
  String filename;
  PImage BG;
  PVector posTracker;
  
  HomeBG()
  {
    posTracker = new PVector(-500,0.00);
  
  }//end product constructor
}

class ButtonPane
{
  PVector posTracker;
  Float paneWidth;
  Float paneHeight;
  
  ButtonPane()
  {
    posTracker = new PVector(width * 0.70, height * 0.10);
    paneWidth = width * 0.25;
    paneHeight = height * 0.80;
  
  }//end product constructor
}
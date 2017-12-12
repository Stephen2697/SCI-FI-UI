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
  Float posCounter;
  
  
  ButtonPane()
  {
    posCounter = 0f;
    posTracker = new PVector(width * 0.65, height * 0.10);
    paneWidth = width * 0.33;
    paneHeight = height * 0.80;
  
  }//end product constructor
}

//sub class inherits container boundaries
class Button extends ButtonPane
{
  Float gapY;
  PVector buttonStart;
  //PVector selectorStart;
  Float buttonWidth;
  Float buttonHeight;
  int numButtons;
  //Float selectorHeight;
  //Float selectorWidth;
    
  Button()
  {
    numButtons=4;
    posTracker = new PVector(width * 0.65, height * 0.10);
    paneWidth = width * 0.25;
    paneHeight = height * 0.80;
    gapY = paneHeight/(numButtons);
    
    buttonStart = new PVector((posTracker.x+paneWidth*.25), posTracker.y+(paneHeight*.1));
    //selectorStart =  new PVector(posTracker.x-20, posTracker.y-20);
    
    buttonWidth = paneWidth * 0.99;
    buttonHeight = (paneHeight * 0.5)/6;
    
    //selectorHeight = buttonHeight*1.2;
    //selectorWidth = buttonWidth*1.2;
    
    
  }
  
  
}
//Encapsulation Procedure:
class HomeBG
{
  String filename;
  PImage BG;
  PVector posTracker;
  
  HomeBG()
  {
    posTracker = new PVector(0,0.00);
  
  }//end product constructor
}

class Button
{
  PVector buttonStart;
  
}

//Subclass Inherits fields from Superclass
class MenuItem extends Button
{
  String Name;
  
  MenuItem(TableRow row)
  {
    Name = row.getString("Name");
    buttonStart = new PVector(0,0);
  }//end constructor
  
  String toString()
  {
    
    return Name;
  } //end toString()
}//end classification
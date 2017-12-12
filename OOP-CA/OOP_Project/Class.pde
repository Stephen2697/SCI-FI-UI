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
  String toString()
  {
    
    return filename;
  } //end toString()
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

class MartianVars 
{
  float mass;
  float diameter;
  float density;
  float gravity;
  float orbitPeriod;
  float avgTemp;
  
  MartianVars(TableRow row)
  {
    mass = row.getFloat("Mass");
    diameter = row.getFloat("Diameter");
    density = row.getFloat("Density");
    gravity = row.getFloat("Gravity");
    orbitPeriod = row.getFloat("Orbital Period");
    avgTemp = row.getFloat("Mean Temperature");
    
  }//end constructor
  
  String toString()
  {
    
    return str(mass);
  } //end toString()
}//end classification
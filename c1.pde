class Choice
{
  int year;
  int month;
  float price;
  
  Choice(String line)
  {
    String[] fields = line.split(",");
  
    year = Integer.parseInt(fields[0]);
    month = Integer.parseInt(fields[1]);
    price = Float.parseFloat(fields[3]);
   
  }
    

  void display() 
  {
      background(0);
      fill(255,0,0);
      rect(5,height - 40,70,30);
      fill(255);
      text("BACK", 40, height - 15);
      textSize(25);
      text("Change in oil prices over time", (width/2), 50);
  } 

}




Choice choice;
Choice choice2;


ArrayList<Choice> oil = new ArrayList<Choice>();
void setup()
{
  size(700,500);
  background(0);

  
  String[] lines = loadStrings("PriceOfBarrel.csv");//load in the data
  for( String line: lines)
  {
    choice = new Choice(line);
    oil.add(choice);
  }
  
  String[] lines2 = loadStrings("PriceOfBarrel.csv");//load in the data
  for( String line: lines2)
  {
    choice2 = new Choice(line);
    oil.add(choice2);
  }
 
}

float bottom_border = 100;
float side_border= 50;
void drawgraph()
{
  float min = 12.93;
  float max = 123.78;
  stroke(255);
  
  line( side_border, height - bottom_border, side_border, bottom_border);//drawing the axis
  line( side_border, height - bottom_border, width - side_border, height - bottom_border);
 
  if (mouseX >= side_border && mouseX <= width - side_border)
  {
    int x = (int) map(mouseX, side_border, width - side_border, 0, oil.size() - 1);
    float y = map(oil.get(x).price, min, max, height - bottom_border, bottom_border);
    textSize(15);
    text("Year: " + oil.get(x).year, mouseX + 10, y);
    text("Barrel: $" + oil.get(x).price, mouseX + 10, y + 10);
  }
  
  for (int i = 1 ; i < oil.size() ; i ++)
  {
    float x1 = map(i - 1, 0, oil.size() - 1, side_border, width - side_border);
    float y1 = map(oil.get(i - 1).price, min, max, height - bottom_border, bottom_border);
    float x2 = map(i, 0, oil.size() - 1, side_border, width - side_border);
    float y2 = map(oil.get(i).price, min, max, height - bottom_border, bottom_border);
    line(x1, y1, x2, y2);
  }
}

void drawthing()
{
  float min = 12.93;
  float max = 123.78;
  stroke(255);
  
  line( side_border, height - bottom_border, side_border, bottom_border);//drawing the axis
  line( side_border, height - bottom_border, width - side_border, height - bottom_border);
  for (int i = 1 ; i < oil.size() ; i ++)
  {
    float x = map(i - 1, 0, oil.size() - 1, side_border, width - side_border);
    float y = map(oil.get(i - 1).price, min, max, height - bottom_border, bottom_border);
    float red = map(oil.get(i).price, min, max, 0, 255);
    float green = map(oil.get(i).price, min, max, 0, 255);
    if( oil.get(i).price > 45 )
    {
      fill(red,0,0);
    }
    else
    {
      fill(0,green,0);
    }
    
    float barwidth = (width - (2*side_border)) / oil.size();
    rect(x, y, barwidth, height - bottom_border - y);
    
  }
}

void draw()
{
  if( option == 0)//displays the menu
  {
    background(0);
    textAlign(CENTER);
    textSize(25);
    fill(255);
    text("Choose which visualisation to show", (width/2), 50);
    rect(200, 200, 300, 50);
    rect(200, 300 , 300, 50);
    fill(0);
    text("Line Graph", (width/2), 235);
    text("Color Graph", (width/2), 335);
  }
  if( option == 1)
  {
    choice.display();
    drawgraph();
  }
  if( option == 2)
  {
    choice2.display();
    drawthing();
  }
  
}
int option = 0;
void mouseClicked()
{
  if(mouseX > 200 && mouseX < 500 && mouseY > 200 && mouseY < 250 && option == 0)
  {
    option = 1;
  }
  if(mouseX > 200 && mouseX < 500 && mouseY > 300 && mouseY < 350 && option == 0)
  {
    option = 2;
  }

  if(mouseX > 5 && mouseX < 75 && mouseY > (height - 40) && mouseY < (height - 10) && option > 0 && option < 3)
  {  
    option = 0;
  }
}




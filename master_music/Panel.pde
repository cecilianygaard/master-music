class Panel
{
  ArrayList<Panel>Children = new ArrayList<Panel>();
  Panel parent;
  
  int x;
  int y;
  int w; 
  int h;

  boolean isOpen = false;

  Panel(int px, int py, int pw, int ph) 
  {
    x = px;
    y = py;
    w = pw;
    h = ph;
  }

  void addPanel(Panel p)
  {
    p.parent = this;
    Children.add(p);
  }

  void openPanel() 
  {
    isOpen = true;
    if (debugMode)
      println("openPanel:"+this.getClass());
    for (Panel p : Children)
      p.openPanel();
      
  }

  void closePanel() 
  {
    isOpen = false;
    for (Panel p : Children)
      p.closePanel();
  }
  
  void debugDumpPanel(int level)
  {
    for (int i=0; i<level ; i++)
      print("- ");
    println("Panel - Open:" + isOpen + " Class:" + this.getClass());
    for (Panel p : Children)
      p.debugDumpPanel(level+1);
  }
  
  void drawPanel() 
  {
    if (isOpen == false) return;
    
    pushMatrix();
    translate(x, y);
   
    onDraw();

    if (debugMode)
    {
      noFill();
      stroke(0);
      
      line(0,0,w,h);
      line(w,0,0,h);
  
    }
    
    for (Panel p : Children)
      p.drawPanel();

    popMatrix();
  }
  
  void onDraw()
  {
    
  }
  
  boolean clicked(int px, int py)
  {
    if (isOpen == false) return(false);
    
    px = px-x;
    py = py-y;
    
    if (px>0 && px<w && py>0 && py<h)
    {
      if (onClicked(px,py))
        return(true);
      
      for (Panel p : Children)
        if (p.clicked(px,py))
          return(true);
     
    }
    return(false);
  }
  
  boolean onClicked(int px, int py)
  {
    return(false);
  }
  
}

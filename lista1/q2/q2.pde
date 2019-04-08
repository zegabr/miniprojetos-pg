void setup() {
//i
  size(800, 600, P2D);
}

void setupCoordinateSystem() {
  translate(width / 2, height / 2);
  scale(30, -30);
}

float OmbroX=0, OmbroY=5;
float CutoX=0, CutoY=3;
float MaoX=0, MaoY=0;
float tetasup = 0;
float tetainf = 0;
void draw (){
  setupCoordinateSystem();
  background(255);
  stroke(255,0,0);
  line (OmbroX,OmbroY,CutoX, CutoY);
  line (CutoX,CutoY,MaoX,MaoY);
 
  
  stroke(0);
  point(MaoX,MaoY);
  point(OmbroX,OmbroY);
  point(CutoX,CutoY);


  if(tetasup<PI/6){
    tetasup += (PI/720);
    CutoX = 2 * sin(tetasup);
    CutoY = 5 - 2 * cos(tetasup);
    
    tetainf += (PI/360) ;
    MaoX = CutoX + 3 * sin(tetainf+tetasup);
    MaoY = CutoY - 3 * cos(tetainf+tetasup);
  }

}

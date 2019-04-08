void setup() {
  size(1600, 1200, P2D);
}
//n
void setupCoordinateSystem() {
  translate(width / 2, height / 2);
  scale(30, -30);
}

  boolean indo = true, acabou=false;
  float xi = 1;
  float yi = 0;
  float xf = -2;
  float yf = 0;
  
  float xc = (xf+xi)/2;
  float yc = (yf+yi)/2;
  
  float x = xi;
  float y = yi;

  float teta = 0;

void draw (){
  setupCoordinateSystem();
  background(255);
  stroke(240,0,180);  
  point(x,y);
  //PVector vector = new PVector(1-0,0-0);
  //float angle = atan2 (vector.y,vector.x);
    x = ((teta/(float)Math.PI)+1)*cos(teta);
    y = ((teta/(float)Math.PI)+1)*sin(teta);
  if(indo){
    teta += (float) Math.PI/120;
    indo = teta<Math.PI;
  }else if(!acabou){    
    teta -= (float) Math.PI/120;
    acabou = teta < 0;
  }
  
}
/* segunda solução
void setup() {
  size(800, 600, P2D);
}

void setupCoordinateSystem() {
  translate(width / 2, height / 2);
  scale(30, -30);
}

float angulo=0;
float xp=1,yp=0;
float teta=0;
float vel = (PI/2)/60;
void draw() {
  setupCoordinateSystem();
  background(255);
  
  stroke(0,255,0);
  point(0,0);
  point(1,0);
  point(-2,0);
  
  stroke(0,0,255);
  point(xp,yp);
  
  angulo=min(teta, 2*PI-teta);
  
  xp= (angulo/PI +1)*cos(teta);
  yp= (angulo/PI +1)*abs(sin(teta));
  
  teta = (teta+vel)%(2*PI);
}



*/

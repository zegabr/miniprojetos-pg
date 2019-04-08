void setup() {
  size(1000, 1000, P3D);
  background(255);
}


float vX = 0.01, vY = 0.01;
void howToSeeThings() {
  background(255);
  translate(width / 2, height / 2);
  scale(35, -35);
  /*
  rotateX(vX*mouseX);
  rotateY(vY*mouseY);
  */
  rotateX(-PI/3);
  rotateZ(-PI/3);
}


void desenhaRampaEEixos() {
  //desenhando eixos para melhor vizualizacao
  stroke(255, 0, 0);//X red
  point(100, 0, 0);
  line(100, 0, 0, 0, 0, 0);

  stroke(0, 255, 0);//y green
  point(0, 100, 0);
  line(0, 100, 0, 0, 0, 0);

  stroke(0, 0, 255);//z blue
  point(0, 0, 10);
  line(0, 0, 100, 0, 0, 0);

  point(bx, by, bz);
  point(ax, ay, az);
  point(cx, cy, cz);  
  point(dx, dy, dz);
  stroke(100, 100, 100);
  line(ax, ay, az, bx, by, bz);
  line(bx, by, bz, dx, dy, dz);
  line(ax, ay, az, cx, cy, cz);
  line(dx, dy, dz, cx, cy, cz);
}

int indo=1;
float angperna=radians(30);
float jx=-0.1, jy=0, jz=-0.25;
void desenhapernas(){
//aqui pernas está no centro, alinhado com xz
 stroke(50,50,0);
pushMatrix();  
//perna (only need one muahaha)
rotate(angperna);
line(0,0,0,jx,jy,jz);
line(jx,jy,jz,0,0,-0.5);
popMatrix();

angperna++;
}

void malabares(){
  //aqui a origem está no topo do tronco
 pushMatrix();
 translate(0.5,0,sin(radians(30)));
 point(0,0,0);
 pushMatrix();
 rotateX(angperna/10);

 
 stroke(222,0,0);
 point(0,-1,0);
 stroke(0,222,0);
 point(0,1,0);
 stroke(0,0,222);
 point(0,0,tan(radians(60)));
 popMatrix();
 
 popMatrix();
}

void palhacada(){
  pushMatrix();
  
  stroke(252,0,0);
  line(0,0,1.5, 0,0,2.5);//corpo tam=1
  
pushMatrix();

  translate(0,0,3);
   
  stroke(0,255,0);
  sphere(0.2);//cabeca
  stroke(0);
  
  pushMatrix();
  translate(0,0.2,0.2);
  sphere(0.1);//orelha 1
  popMatrix();
  
  pushMatrix();
  translate(0,-0.2,0.2);
  sphere(0.1);//orelha 1
  popMatrix();
  

popMatrix();

  pushMatrix();
 
  translate(0,0,2.5);//topo do tronco
  
  malabares();
  
  stroke(255,95,192);
  line(0,-1,0,0,1,0);//bracos
  stroke(100,0,30);
  line(0,-1,0,0,-1,0.5);//mao direita
  line(0,1,0,0,1,0.5);//mao esquerda
  
  popMatrix();
  
  pushMatrix();
  translate(0,0,1.5);//partes baixas
  desenhapernas();
  popMatrix();
  
  
  
  
  popMatrix();
}



float ax=0, ay=0, az=0, 
  bx=10, by=0, bz=0, 
  cx=0, cy=8, cz=6, 
  dx=10, dy=8, dz=6 ;
float tetacentro=0, tetaroda=0;
int slower=20;//quanto maior o slower, mais lento. slower=1 é o padrao pra rodar em 1 seg
int k=1;



void draw () {

 

  //o draw reseta o sistema de coordenadas a cada vez que é chamado
  if (k==61 && slower==1)return;
  k++;

  howToSeeThings();
  desenhaRampaEEixos();

  rotateX(radians(37));//alinha plano XY com a rampa

  translate(5, 5, 0);//origem agora no centro da rampa, centro da roda em (0,-5,1)

  stroke(0);//preto
  ellipse(0, 0, 10, 10);//desenhando a circunferncia da rampa

  rotateZ(tetacentro); //aqui abaixo tudo (os 2 pontos desenhados em seguida) será rotacionado em Z  

  translate(0, -5, 1);//origem no centro da roda que está alinhada com XZ
  stroke(0, 255, 0);//verde
  point(0, 0, 0);//centro roda
  //desenhar palhaco aqui
  palhacada();

  pushMatrix();//desenhando roda isoladamente e alinhando perpendicularmente com a rampa
  stroke(255, 255, 0);//amarelo
  rotateX(PI/2);//alinha com eixo XZ (pra ficar perpendicular ao XY(rampa))
  ellipse(0, 0, 1.8, 1.8);//desenho da roda
  popMatrix();

  pushMatrix();//só rotaciona o ponto da roda
  rotateY(tetaroda);
  stroke(255, 0, 0);
  point(0, 0, -1);//ponto da roda
  
  popMatrix();


  tetacentro+=(PI/30)/slower;
  tetaroda+=(PI/6)/slower;
}

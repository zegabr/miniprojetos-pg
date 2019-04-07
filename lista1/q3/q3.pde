void setup() {
  size(1000, 1000, P3D);
  background(255);
}

void howToSeeThings() {
  background(255);
  translate(width / 2, height / 2);
  scale(30, -30);
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
  ///
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





float ax=0, ay=0, az=0, 
  bx=10, by=0, bz=0, 
  cx=0, cy=8, cz=6, 
  dx=10, dy=8, dz=6 ;
float tetacentro=0, tetaroda=0;
int slower=2;//quanto maior o slower, mais lento. slower=1 é o padrao pra rodar em 1 seg
int k=0;


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

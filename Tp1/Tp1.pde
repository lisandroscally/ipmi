PImage mural;

void setup() {
  size(800, 400);
  mural = loadImage("Mural.jpeg");
  
  mural.resize(400, 400); 
}

void draw() {
  background(50); 
  image(mural, 0, 0);
  pushMatrix();
  translate(400, 0);   
  
  drawgato();     
  
  popMatrix();
}
void drawgato() { 
  fill(80, 140, 220);
  noStroke();
  rect(0, 0, 400, 400);
  
 
  
 //Orejas (Parte interior)
  fill (255,200,0);
  stroke (255,0,0);
  strokeWeight (0);
  triangle(130, 150, 110, 90, 170, 110);
  triangle(270, 150, 290, 90, 230, 110); 
  
  // Orejas
  stroke (200,180,190);
  strokeWeight (10);
  triangle(130, 150, 110, 90, 170, 110);
  triangle(270, 150, 290, 90, 230, 110);

  

  
  
  

  // Brazo izquierdo
  fill(200, 180, 190);
  stroke (200,180,190);
  strokeWeight (40);
  line(120, 260, 70, 320); 
  line (40, 260, 70, 320);
  //Mano izquierda
  fill(200,180,190);
  stroke (0);
  strokeWeight (0);
  ellipse (40,250,60,60);
  // Brazo derecho
  fill (200,180,190);
  stroke (200,180,190);
  strokeWeight (40);
  line(280, 260, 330, 320);
  line (350, 280, 330, 320);
  //Mano derecha
   fill(200,180,190);
  stroke (0);
  strokeWeight (0);
  ellipse (360,260,60,60);
  // Remera
  fill(118, 25, 148);
  stroke(0);
  strokeWeight(0);
  beginShape();
    vertex(115, 255);
    vertex(112, 322);
    vertex(135, 365);
    vertex(265, 365);
    vertex(288, 322);
    vertex(280, 255);
    vertex(245, 240);
    vertex(150, 240);
  endShape(CLOSE);

  
 
  //Cuello
  fill (200,180,190);
  stroke (0);
  strokeWeight (0);
  ellipse (200,250,70,60);
    // Cabeza
  fill(200, 180, 190);
  stroke(0);
  strokeWeight(0);
  ellipse(200, 180, 180, 160);
    // Sonrisa
  fill(255,255,255);
  stroke (0);
  strokeWeight (0);
  arc(200, 210, 80, 60, 0.2, PI - 0.2);
  line(200, 210, 50, 30, 0.2, PI - 0.2);
    //Cachete izquierdo
  fill (255,200,0);
  stroke (0);
  strokeWeight(0);
  ellipse (140,200,40,40);
  //Cachete derecho
    fill (255,200,0);
  stroke (0);
  strokeWeight(0);
  ellipse (260,200,40,40);
   // Lentes violetas
  fill (118,25,148);
  square (130,140,60);
  square (210,140,60);
  square (190,160,20);
  //Texto de 'ACDC'
  fill (255,255,0);
  stroke (10);
  strokeWeight (6);
  textSize(28);
  text("ACDC", 170, 300);
  // Bigotes
  fill (255,255,0);
  stroke (255,255,0);
  strokeWeight (4);
  line(120, 190, 80, 180);
  line(120, 200, 75, 200);
  line(120, 210, 80, 220);
    line(280, 190, 320, 180);
  line(280, 200, 325, 200);
  line(280, 210, 320, 220);
  //Parte de abajo
  fill (200,180,190);
  stroke (0);
  strokeWeight (0);
  square (135,365,130);
  //collar
  fill (100,125,100);
  stroke (0);
  strokeWeight (0);
  ellipse (160,255,10,10);
  ellipse (165,260,10,10);  
  ellipse (170,265,10,10);
  ellipse (175,270,10,10);
  ellipse (180,275,10,10);
  ellipse (185,275,10,10);
  ellipse (190,275,10,10);
  ellipse (195,275,10,10);
  ellipse (200,275,10,10);
  ellipse (205,275,10,10);
  ellipse (210,275,10,10);
  ellipse (215,275,10,10);
  ellipse (220,270,10,10);
  ellipse (225,265,10,10);
  ellipse (230,260,10,10);
  ellipse (235,255,10,10);
  //nariz
  fill (255,182,193);
  stroke (0);
  strokeWeight (0);
  triangle (204,210,225,200,185,200);
  //brillo
  fill (255,255,0);
  stroke (255,255,0);
  strokeWeight (6);
 line (180,195,140,145);
 line (265,195,215,145);
noStroke();
}

// Presentación dinámica - Los Piojos
// Usa variables y condicionales

PImage fondo;
PImage lospiojos;
PImage lospiojos2;
PImage Ciro;
PImage Daniel;
PImage Micky;
PImage Piti;
PImage Tavo;
PFont fuenteTitulo, fuenteTexto;

int slide = 0;           
int timer = 0;           
float alpha = 0;         
float pulso = 0;      

String[] titulos = {
  "LOS PIOJOS",
  "Historia",
  "Miembros",
  "Éxitos",
  "¡Gracias!"
};

color[] colores = {
  color(255, 0, 0),    
  color(200, 50, 0),    
  color(255, 215, 0),   
  color(0, 200, 100)     
};

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);
  lospiojos= loadImage("Lospiojos.jpg");
  Ciro= loadImage("ciro.jpg");
  Daniel= loadImage ("Daniel-Buira.jpg");
  Micky= loadImage ("Micky.jpg");
  Tavo= loadImage ("gustavokupinski.jpg");
  Piti= loadImage ("pitifernandez.jpg");
  lospiojos2= loadImage ("Lospiojos2.jpeg");
  fuenteTitulo = createFont("Impact", 72);
  fuenteTexto = createFont("Arial Black", 32);
}

void draw() {
  background(0);
  
  fill(0, 0, 0, 0);
  rect(0, 0, width, height);
  
  timer++;
  pulso = sin(frameCount * 0.08) * 15;  // Animacion
  
  switch(slide) {
    case 0:  // Portada
      drawPortada();
      break;
      
    case 1:  // Historia
      drawHistoria();
      break;
      
    case 2:  // Miembros
      drawMiembros();
      break;
      
    case 3:  // Éxitos
      drawExitos();
      break;
      
    case 4:  // Final
      drawFinal();
      break;
  }
  
  // Barra de progreso
  drawProgressBar();
  
  // Instrucciones
  fill(255, 150);
  textFont(fuenteTexto);
  textSize(18);
  text("← →  Cambiar diapositiva", width/2, height - 30);
}

void drawPortada() {
  // Fondo con pulso
  fill(0, 30 + pulso, 30 + pulso, 0);
  rect(0, 0, width, height);
  
  fill(255);
  textFont(fuenteTitulo);
  textSize(110 + pulso/3);
  text("LOS PIOJOS", width/2, height/2 - 100);
  image (lospiojos,190,230);
  textFont(fuenteTexto);
  textSize(42);
  
  textSize(28);
  
  // Condicional: efecto cuando el mouse está sobre el centro
  if (dist(mouseX, mouseY, width/2, height/2) < 200) {}
}

void drawHistoria() {
  fill(255);
  textFont(fuenteTitulo);
  textSize(70);
  text(titulos[1], width/2, 100);
  
  textFont(fuenteTexto);
  textSize(28);
  text("Fundada en 1987 en Buenos Aires", width/2, 220);
  text("Líder: Ciro Martínez", width/2, 280);
  text("Más de 30 años de trayectoria", width/2, 340);
  text("Referente del rock barrial argentino", width/2, 400);
  
  // Animacion
  if (timer % 120 < 60) {
    fill(255, 220, 0);
    textSize(32);
    text("¡Sigue vigente!", width/2, 520);
  }
}

void drawMiembros() {
  fill(255);
  textFont(fuenteTitulo);
  textSize(70);
  text(titulos[2], width/2, 100);
  
  textFont(fuenteTexto);
  textSize(15);
  text("Ciro Martínez - Voz y guitarra", width/4, 280);
  image (Ciro,100,150);
  Ciro.resize (100,100);
  text("Daniel Buira - Baterista", width/1.5, 282);
  image (Daniel,380,160);
  Daniel.resize (100,100);
  image (Tavo,380,290);
  Tavo.resize (100,100);
  text("Tavo Kupinski - Guitarrista Principal", width/1.5, 400);
  image (Piti,100,290);
  Piti.resize (100,100);
    textSize(13);
  text("Piti Fernandez - Compositor", width/4.5, 400);
}

void drawExitos() {
  fill(255);
  textFont(fuenteTitulo);
  textSize(70);
  text(titulos[3], width/2, 100);
  textFont(fuenteTexto);
  textSize(30);
  text ("Tan Solo",width/2,200);
  text ("Bicho De Ciudad",width/2,240);
  text ("Como Ali",width/2,280);
  text ("Todo Pasa",width/2,320);
  textFont(fuenteTexto);
  textSize(36);
  
  for (int i = 0; i < 5; i++) {
    float y = 220 + i * 65;
    // Condicional: resaltar la canción actual con pulso
    if (i == (timer/80) % 5) {
      fill(255, 215, 0);
      textSize(42 + pulso/4);
    } else {
      fill(220);
      textSize(36);
    }
  }
}

void drawFinal() {
  fill(255, 215 + pulso*2, 0);
  textFont(fuenteTitulo);
  textSize(85);
  text("¡GRACIAS!", width/2, height/2 - 60);
  
  textFont(fuenteTexto);
  textSize(20);
  fill(255);
  
  if (timer % 40 < 20) {
    textSize(26);
    text("Hace click para reiniciar", width/2, height/2 + 120);
  }
}

// Barra de progreso
void drawProgressBar() {
  float progreso = map(slide, 0, 4, 0, width);
  fill(255, 255, 255);
  rect(0, height - 8, progreso, 8);
}


void keyPressed() {
  if (keyCode == RIGHT) {
    slide = min(slide + 1, 4);
    timer = 0;
  }
  if (keyCode == LEFT) {
    slide = max(slide - 1, 0);
    timer = 0;
  }
  if (key == 'r' || key == 'R') {
    slide = 0;
    timer = 0;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    slide = (slide + 1) % 5;
    timer = 0;
  }
}

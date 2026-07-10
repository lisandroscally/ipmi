//Lisandro Scally, Comison 3, Recuperatorio tp2, Legajo: 125687/5

PImage lospiojos;
PImage lospiojos2;
PImage Ciro;
PImage Daniel;
PImage Micky;
PImage Piti;
PImage Tavo;
PImage Roger;

PFont fuenteTitulo, fuenteTexto;

int slide = 0;
int timer = 0;
int slideDuration = 620;
int transitionDuration = 75;

float transitionProgress = 0;
boolean isTransitioning = false;
int nextSlide = 0;

float pulso = 0;
float alpha = 0;

String[] titulos = {
  "LOS PIOJOS", 
  "Historia", 
  "Miembros", 
  "Éxitos", 
  "¡Gracias!"
};

void setup() {
  
  //imagenes
  
  size(640, 480);
  textAlign(CENTER, CENTER);
  
  lospiojos = loadImage("Lospiojos.jpg");
  lospiojos2 = loadImage("Lospiojos2.jpeg");
  Ciro = loadImage("ciro.jpg");
  Daniel = loadImage("Daniel-Buira.jpg");
  Micky = loadImage("Micky.jpg");
  Piti = loadImage("pitifernandez.jpg");
  Tavo = loadImage("gustavokupinski.jpg");
  Roger = loadImage("rogercardero.jpg");
  
  lospiojos.resize(300, 200);
  lospiojos2.resize(280, 180);
  Ciro.resize(110, 110);
  Daniel.resize(110, 110);
  Micky.resize(110, 110);
  Piti.resize(110, 110);
  Tavo.resize(110, 110);
  Roger.resize(110, 110);
  
  //fuentes elegidas
  
  fuenteTitulo = createFont("Jokerman", 72);
  fuenteTexto = createFont("Arial Black", 32);
}

void draw() {
  background(0);
  
//transiciones  

  timer++;
  pulso = sin(frameCount * 0.08) * 12;
  alpha = map(sin(frameCount * 0.1), -1, 1, 160, 255);
  
  //
  if (!isTransitioning && slide < 4 && timer > slideDuration) {
    startTransition();
  }
  
  if (isTransitioning) {
    transitionProgress += 1.3 / transitionDuration;
    if (transitionProgress >= 1.0) {
      slide = nextSlide;
      timer = 0;
      isTransitioning = false;
      transitionProgress = 0;
    }
  }
  
  float currentAlpha = isTransitioning ? map(transitionProgress, 0, 1, 255, 40) : 255;
  drawSlide(slide, currentAlpha, 0);

  if (isTransitioning) {
    float nextAlpha = map(transitionProgress, 0, 1, 40, 255);
    float textOffsetY = map(transitionProgress, 0, 1, 60, 0);
    
    drawSlide(nextSlide, nextAlpha, textOffsetY);
  }
 

  drawProgressBar();
  
  if (slide < 4) {
    fill(255, 160);
  
  }
}


void drawSlide(int s, float baseAlpha, float textOffsetY) {
  switch(s) {
    case 0: drawPortada(baseAlpha, textOffsetY); break;
    case 1: drawHistoria(baseAlpha, textOffsetY); break;
    case 2: drawMiembros(baseAlpha, textOffsetY); break;
    case 3: drawExitos(baseAlpha, textOffsetY); break;
    case 4: drawFinal(baseAlpha, textOffsetY); break;
  }
}
void startTransition() {
  isTransitioning = true;
  nextSlide = slide + 1;
  transitionProgress = 0;
}

//diapositivas

void drawPortada(float alpha, float offsetY) {
  tint(100, alpha);
  image(lospiojos, width/2 - lospiojos.width/2, 140);
  noTint();
  
  textFont(fuenteTitulo);
  float escala = 1 + sin(frameCount * 0.1) * 0.08;
  textSize(92 * escala);
  fill(255, 220, 0, alpha);
  text(titulos[0], width/2, height/2 - 110 + offsetY);
  tint(255, alpha);
  noTint();
}

void drawHistoria(float alpha, float offsetY) {
  textFont(fuenteTitulo);
  textSize(68);
  fill(255, alpha);
  text(titulos[1], width/2, 80 + offsetY);
  
  textFont(fuenteTexto);
  textSize(18);
  String[] textos = {
    "Fundada en 1988 en Buenos Aires por Micky, Daniel y Pity",
    "La banda salto a la fama despues de que Ciro se sumase",
    "En 1989, quien habia ingresado como bajista suplente luego",
    "Pasaria a ser su cantante y lider, la banda se separo en 2009",
     "Pero volvio en el 2024 con una serie de recitales",
  };
  
  for (int i = 0; i < textos.length; i++) {
    float y = 190 + i * 55 + offsetY;
    float op = map(timer, i*60, i*60 + 50, 0, alpha);
    fill(255, constrain(op, 0, alpha));
    text(textos[i], width/2, y);
  }
  

  tint(255, alpha);
  noTint();
}

void drawMiembros(float alpha, float offsetY) {
  textFont(fuenteTitulo);
  textSize(68);
  fill(255, alpha);
  text(titulos[2], width/2, 70 + offsetY);
  
  textFont(fuenteTexto);
  textSize(17);
  fill(255, alpha);
  
  image(Ciro, 70, 130);    
  text("Ciro Martínez\nVoz y Guitarra", 125, 265 + offsetY);
  
  image(Piti, 460, 130);   
  text("Piti Fernández\nBajo y Coros", 515, 265 + offsetY);
  
  image(Tavo, 70, 300);    
  text("Tavo Kupinski\nGuitarra", 125, 435 + offsetY);
  
  image(Daniel, 460, 300); 
  text("Daniel Buira\nPrimer Baterista", 515, 435 + offsetY);
  
  tint(255, alpha);
  image(Roger, 260, 130, 110, 110);
  noTint();
  
  fill(255, alpha);
  text("Roger Cardero\nSegundo Baterista", 320, 268 + offsetY);
}

void drawExitos(float alpha, float offsetY) {
    tint(100, alpha);
  image(lospiojos2, 0, 0, 700, 500);
  textFont(fuenteTitulo);
  textSize(68);
  fill(255, alpha);
  text(titulos[3], width/2, 80 + offsetY);
  
  textFont(fuenteTexto);
  String[] exitos = {"Tan Solo", "Bicho De Ciudad", "Como Ali", "Todo Pasa", "El Farolito"};
  
  for (int i = 0; i < exitos.length; i++) {
    float y = 170 + i * 55 + offsetY;
    if (i == (timer / 70) % 5) {
      fill(255, 215, 0, alpha);
      textSize(38 + pulso * 0.6);
    } else {
      fill(220, alpha);
      textSize(29);
    }
    text(exitos[i], width/2, y);
  }
  
  tint(255, alpha);
  noTint();
}

void drawFinal(float alpha, float offsetY) {
  textFont(fuenteTitulo);
  textSize(88);
  fill(255, 220, 60, alpha);
  text("¡GRACIAS!", width/2, height/2 - 80 + offsetY);
  
//boton de "reiniciar presentacion"
  
  float btnY = height/2 + 110;
  boolean sobreBoton = mouseY > btnY - 30 && mouseY < btnY + 30 && 
                       mouseX > width/2 - 130 && mouseX < width/2 + 130;
  
  fill(sobreBoton ? color(20, 0, 40, alpha) : color(10, 0, 30, alpha));
  rect(width/2 - 200, btnY - 25, 400, 50, 15);
  
  fill(255, alpha);
  textSize(24);
  text("Reiniciar Presentacion?", width/2, btnY + 3);
}

//barra de progreso, al hacer click la diapositiva cambia mas rapido en vez de ir de forma automatica
  
void drawProgressBar() {
  float progreso = map(slide + (timer / (float)slideDuration), 0, 5, 0, width);
  fill(255, 140, 0);
  rect(0, height - 10, progreso, 10);
}

void mousePressed() {
  if (slide < 4) {
    if (!isTransitioning) {
      startTransition();
    }
  } else {
    float btnY = height/2 + 110;
    if (mouseY > btnY - 35 && mouseY < btnY + 35 && 
        mouseX > width/2 - 130 && mouseX < width/2 + 130) {
      slide = 0;
      timer = 0;
      isTransitioning = false;
      transitionProgress = 0;
    }
  }
}

//* Lisandro Scally, tp3, Comision 3 *//
PImage arteoptico;
color col1, col2, col3;
boolean distortionActive = false;
float distortionTime = 0;

//e
float[] ellipseX = { 
  65,  165, 265, 365, 
  55,  155, 255, 355, 
  70,  170, 270, 370 
};

float[] ellipseY = { 
  72,  72,  72,  72,
  185, 185, 185, 185,
  295, 295, 295, 295 
};

float[] ellipseR = { 
  31, 33, 30, 34,
  29, 35, 32, 31,
  33, 30, 34, 32 
};


color[] ellipsebase = {
  color(232, 212, 168),
  color(224, 192, 144),
  color(212, 196, 160),
  color(168, 200, 160),
  color(184, 212, 176),
  color(152, 184, 224),
  color(232, 212, 168),
  color(168, 192, 144),
  color(136, 176, 216),
  color(200, 180, 130),
  color(160, 195, 155),
  color(130, 170, 210)
};

void setup() {
  size(800, 400);
  arteoptico = loadImage("ArteOptico.jpeg");
 
  col1 = color(0, 255, 0);
  col2 = color(0, 100, 255);
  col3 = color(255, 0, 0);
}

void draw() {
  background(200);
 
  image(arteoptico, 0, 0, 400, 400);
 
  pushMatrix();
  translate(400, 0);
 
  dibujarrojo();
  dibujarlineasverdesyazules();
  dibujarellipses();
  dibujarrojodistorsion();
 
  popMatrix();
}

// distorsion de las lineas rojas
void mousePressed() {
  distortionActive = !distortionActive;
  if (!distortionActive) distortionTime = 0;
}

// 
void dibujarrojo() {
  stroke(col3);
  strokeWeight(9);
  for (int i = 0; i < height + 10; i += 14) {
    line(0, i, 400, i);
  }
}

//lineas verdes y azules en el fondo
void dibujarlineasverdesyazules() {
  for (int y = 0; y < height; y += 3) {
    color currentCol = (y % 6 < 3) ? col1 : col2;
    stroke(currentCol, 185);
    strokeWeight(2.8);
    line(0, y, 400, y);
  }
}

// los circulos
void dibujarellipses() {
  for (int i = 0; i < ellipseX.length; i++) {
    float x = ellipseX[i];
    float y = ellipseY[i];
    float r = ellipseR[i];
    color base = ellipsebase[i];
    fill(base); 
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
}

// distorsion
void dibujarrojodistorsion() {
  if (!distortionActive) {
    // Mo
    stroke(col3, 160);
    strokeWeight(9);
    for (int i = 0; i < height + 10; i += 14) {
      line(0, i, 400, i);
    }
  } else {
    distortionTime += 0.08;
    
    stroke(col3, 160);
    strokeWeight(9);
    
    for (int i = 0; i < height + 10; i += 14) {
      float waveOffset = sin(distortionTime * 2.8 + i * 0.1) * 12;
      for (int x = 0; x < 400; x += 8) {
        float y1 = i + sin(distortionTime * 3 + x * 0.03 + i) * 6;
        float y2 = i + sin(distortionTime * 3 + (x + 8) * 0.03 + i) * 6;
        
        line(x, y1 + waveOffset, x + 8, y2 + waveOffset);
      }
    }
  }
}

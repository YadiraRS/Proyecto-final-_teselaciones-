//CUANDO EL MOUSE SE MUEVE EN SENTIDO VERTICAL HACIA ABAJO Y HACÍA ARRIBA DENTRO DE LA PANTALLA, SE DISTORCIONAN LAS FIGURAS  
// SI EL MOUSE LLEGA HASTA LA PARTE NIFAL DE LA PANTALLA HACIA ARRIBA LAS FIGURAS VUELVEN A SU FORMA ORIGINAL


import processing.video.*;

forma hexa;

ArrayList <forma> formas;

int numPixelsWide, numPixelsHigh;
int blockSize = 15;
Movie mov;
color movColors[];

void setup() {
  size(1280, 720);
  noStroke();
  formas = new ArrayList<forma> ();
   
  formas.add(hexa);
     
  mov = new Movie(this, "DUA 2.mp4");
  mov.loop();
  numPixelsWide = width / blockSize;
  numPixelsHigh = height / blockSize;
  println(numPixelsWide);
  movColors = new color[numPixelsWide * numPixelsHigh];
}

// Display values from movie
void draw() {
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
    int count = 0;
    for (int j = 0; j < numPixelsHigh; j++) {
      for (int i = 0; i < numPixelsWide; i++) {
        movColors[count] = mov.get(i*blockSize, j*blockSize);
        count++;
      }
    }
  }

  background(255);
  for (int j = 0; j < numPixelsHigh; j++) {
    for (int i = 0; i < numPixelsWide; i++) {
      fill(movColors[j*numPixelsWide + i]);
      hexa=new hexagono(i*blockSize, j*blockSize, blockSize, blockSize+0.1*pmouseY);
      hexa.mostrar();
    }
  }

}
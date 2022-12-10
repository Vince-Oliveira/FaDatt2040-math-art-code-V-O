import peasy.*;

int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;

int DIM = 256;
PeasyCam cam;
ArrayList<MandelPoint> mandelbulb = new ArrayList<MandelPoint>();
StringList points = new StringList();
int maxiterations = 20;

class MandelPoint {
  PVector v;
  float i;

  MandelPoint(PVector v, float i) {
    this.v = v;
    this.i = i;
  }
}

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 600);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {

      boolean edge = false;
      int lastIteration = 0;
      for (int k = 0; k < DIM; k++) {
        float x = map(i, 0, DIM, -1, 1);
        float y = map(j, 0, DIM, -1, 1);
        float z = map(k, 0, DIM, -1, 1);

      }
    }
  }
}
  
void draw() {
  background(0);
  rotateX(PI/4);
  rotateY(-PI/3);
  colorMode(HSB, 255);
  for (MandelPoint m : mandelbulb) {
    stroke(map(m.i, 0, maxiterations, 255, 0), 255, 255);
    strokeWeight(1);
    point(m.v.x, m.v.y, m.v.z);
  }
    flying -= 0.1;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }



  background(0);
  stroke(255);
  noFill();

  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
}
}

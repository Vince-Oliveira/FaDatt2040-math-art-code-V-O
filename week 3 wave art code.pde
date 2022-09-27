//perfect wave loop function based off of David Mrugala (thedotisblack)
//Also took inspiration from the super formula by Alexander Miller

float x = 400;
float y = 400;
float angle = 90;
float dia = 20;

void setup() {
  fullScreen();
  background(255);
  smooth();
  strokeWeight(0.5);
  frameRate(30);
  noFill();
}

float t =0;

void draw() {

  translate(width/2, height/2);
  rotate(radians(angle/3));
  for (float a=0; a<360; a+=10) {

    pushMatrix();
    if (angle<360) rotate(radians(a)*sin(radians(angle)));
    else rotate(radians(a));
    stroke(255);
    strokeWeight(3);
    line(x*sin(radians(angle)), 0, 0, y-dia/2);

    noStroke();
    fill(0);
    ellipse(x*sin(radians(angle)), 0, dia/2, dia/2);
    stroke(0);
    noFill();
    ellipse(0, y, dia, dia);
    popMatrix();
  }
  angle++;

beginShape();
stroke(random(0,255));
for(float theta = 0; theta <= 2 * PI; theta += 0.01){
  float rad = r(theta,
  2, // a
  2, // b
  6, // m
  1, // n1
  sin(t)* 0.5 + 0.5, // n2
  cos(t)* 0.5 + 0.5 // n3
  );
  float x = rad * cos(theta) *50;
  float y = rad * sin(theta)*50;
  vertex(x,y);
}

endShape();

t += 0.1;

}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m*theta/4.0)/a), n2) + 
  pow(abs(sin(m*theta/4.0)/b), n3), -1.0 / n1); 
}

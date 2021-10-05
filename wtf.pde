float y = 250.0;
float speed = 1.0;
float radius = 15.0;
float x = 69.0;
int direction = 1;
float angle = 10.0;
float inc = 0.06;
int density = 4;
float znoise = 0.0;

void setup() {
  size(500, 500);
  noStroke();
  ellipseMode(RADIUS);
  fill(174, 221, 60);
  rect(17, 17, 66, 66);
  randomSeed(121);
}

void draw() {
  background(56, 90, 94);
  ellipse(123, y, radius, radius);
  y = y + speed;
  if (y > height+radius) {
    y = -radius;
  }
  
  float xnoise = 0.0;
  float ynoise = 0.0;
  for (int y = 0; y < height; y += density) {
    for (int x = 0; x < width; x += density) {
      float n = noise(xnoise, ynoise, znoise) * 255;
      fill(n);
      rect(y, x, density, density);
      xnoise += inc;
    }
    xnoise = 0.0;
    ynoise += inc;
  }
  znoise += inc;
  
  triangle(150, 100, 123, 60, 75, 65);
  fill(0, 12);
  rect(0, 0, width, height);
  fill(0, 255, 0);
  x += speed * direction;
  if ((x > height+radius) || (y < radius)){
    direction = -direction;
    x = -radius;
    
    angle += random(-300, 300);
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    translate(x, y);
    rotate(angle);
  }
  
  x += random(-2, 10);
  y += random(-2, 10);
  point(x, y);
  
  strokeWeight(12);
  stroke(242, 204, 47, 102);
  line(30, 20, 50, 80);
  stroke(242, 204, 47, 204);
  line(50, 20, 70, 80);
}

int cols, rows;
int scl = 20;
int w = 3000;
int h = 1600;

float flying = 0;
float[][] grid;

void settings() {
  size(1200, 800, PConstants.P3D);
  
  cols = w / scl;
  rows = h / scl;
  grid = new float[cols][rows];
}

void draw() {
  flying -= 0.04;
  
  float yoff = flying;
  for(int y=0; y < rows; y++){
    float xoff = 0;
    for(int x=0; x < cols; x++){
      grid[x][y] = map(noise(xoff, yoff), 0, 1, -60, 60);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2-20, height/2-60);
  rotateX(PI/3);
  // frameRate(1);
  translate(-w/2, -h/2);
  
  for(int y=0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x < cols; x++){
      vertex(x*scl, y*scl, grid[x][y]);
      vertex(x*scl, (y+1)*scl, grid[x][y+1]);
      // rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}

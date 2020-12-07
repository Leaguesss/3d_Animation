PShape randomshape;
float randomSpinSpeed = 16.0;
PImage earthtexture,moontexture,marstexture,mercurytexture,suntexture;
int framectr = 0;
ArrayList<PImage> img_list = new ArrayList<PImage>();
ArrayList<Ball> balls = new ArrayList<Ball>();
float gravity = 0.98;

float bounce = -0.85; //lost 15% enerygy

void setup() {
  size(800, 800, P3D);
  smooth();
  
  //Create the random shape
  earthtexture = loadImage("Textures/earth.jpg");
  marstexture = loadImage("Textures/mars.jpg");
  mercurytexture = loadImage("Textures/mercury.jpg");
  moontexture = loadImage("Textures/moon.jpg");
  suntexture = loadImage("Textures/sun.jpg");
  img_list.add(earthtexture);
  img_list.add(marstexture);
  img_list.add(mercurytexture);
  img_list.add(moontexture);
  img_list.add(suntexture);
  
  
}

void cube(){
  // background  line syntax line(x1, y1, z1, x2, y2, z2)
  line(0, 0, -700, width, 0, -700);
  line(0, 0, -700, 0, 700, -700);
  line(0, 700, -700, width, 700, -700);
  line(width, 700, -700, width, 0, -700);
  
  // frontline
  line(0, 0, -700, 0, 0, 0);
  line(width, 0, -700, width, 0, 0);
  line(0, 700, -700, 0, 700, 0);
  line(width, 700, -700, width, 700, 0);
  
  
}
void draw() {
  background(0);
  lights();
  // box
  stroke(255);
  cube();
  if(balls.size() > 0) {
    for (int i = 0; i< balls.size();i++) {
      balls.get(i).collide();
      balls.get(i).move();
      balls.get(i).display();
    }
  }
  
  
}

PShape randomShape(){ //return the random Texture

  PImage temp_randomTexture = img_list.get(int(random(0,5)) );
  PShape temp_randomshape = createShape(SPHERE,50);
  temp_randomshape.setTexture(temp_randomTexture);
  temp_randomshape.setStroke(255);
  
  return temp_randomshape;

}

void mouseClicked() { // once mouse clicked update the random texture

  randomshape = randomShape();
  Ball ball = new Ball(randomshape, balls);
  balls.add(ball);

}

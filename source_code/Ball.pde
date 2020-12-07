import java.util.Random; 
public class Ball {
  
  PShape ballShape;
  
  int ballSpeed = 15;
  PVector location;
  PVector velocity;
  int framectr = 0;
   
  ArrayList<Ball> otherballs;
  public Ball (PShape ballShape, ArrayList<Ball> otherballs) {
    this.ballShape = ballShape;
    location = new PVector(mouseX,mouseY,-50); // ball initial place 50 is the r of ball
    float y_low_random = random(-15.0,-1);
    float y_high_random = random(1,15.0);
    float randomOfTwoY = new Random().nextBoolean() ? y_low_random :y_high_random;

    velocity = new PVector(random(-15.0,15.0),randomOfTwoY,random(-15.0,15.0));
    this.otherballs = otherballs;
    //System.out.println("velocity; "+velocity.x+":"+velocity.y+":"+velocity.z);
  }
  
  
   void collide() {
    for (int i = 0; i < otherballs.size(); i++) {
      if(otherballs.get(i) != this) {
          float dx = otherballs.get(i).location.x - location.x;
          float dy = otherballs.get(i).location.y - location.y;
          float dz = otherballs.get(i).location.z - location.z;
          float distance = sqrt(dx*dx + dy*dy+ dz*dz);
      
          float minDist = 100;
          if (distance < minDist) {
            bounce(this,otherballs.get(i));
          }
      
      }
    }   
  }
  void bounce(Ball ballOne, Ball ballTwo) {
    PVector pv = new PVector();
    pv.set(ballOne.location);
    pv.sub(ballTwo.location);
    pv.normalize();
    while(ballOne.location.dist(ballTwo.location) < 50+50) {
      ballOne.location.add(pv);
    }
    PVector m = PVector.sub(ballOne.location, ballTwo.location);
    m.normalize(); //Normalize the vector to length 1 (make it a unit vector).
    PVector n = PVector.sub(ballOne.velocity, ballTwo.velocity);
    PVector mn = componentVector(n,m);
    n.sub(mn);
    ballOne.velocity = PVector.add(n, ballTwo.velocity);
    ballTwo.velocity= PVector.add(mn, ballTwo.velocity);
  }
  
  PVector componentVector (PVector vector, PVector dv) {
    dv.normalize();
    dv.mult(vector.dot(dv));
    return dv;
  }
  
  void move(){
     
    // bounce
    if (location.x>650 ) {
      //xPos = 700;
      location.x = 650;
      velocity.x *= bounce;
      
      
    } else if (location.x < 50) {
      location.x = 50;
      velocity.x *= bounce;
    
    } else {
       velocity.x -= velocity.x *0.015;
    }

    if (location.y>650 ) {
      location.y = 650;
      velocity.y*= bounce;
      
     } else if (location.y<50) {
       location.y = 50;
       velocity.y*= bounce;
     }
     
    
    if (location.z<-650 ) {
      location.z = -650;
      velocity.z*= bounce;
    } else if (location.z >-50) {
      location.z = -50;
      velocity.z*= bounce;
    } else {
      velocity.z -= velocity.z *0.015;
    }
    
    
    velocity.y += gravity;
    
    location.add(velocity);
    framectr++;
  }
  
  void display() {
    pushMatrix();
    translate(location.x,location.y,location.z);
    shape(ballShape);
    popMatrix();
    
  }
  
 
}

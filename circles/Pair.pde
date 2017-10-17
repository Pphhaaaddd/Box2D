// Series of Particles connected with distance joints

class Pair {

  Circle p1;
  Circle p2;

  float len;
  // Chain constructor
  Pair(float x, float y) {
    len = 60;

    p1 = new Circle(x,y);
    p2 = new Circle(x+random(-1,1),y+random(-1,1));

    DistanceJointDef djd = new DistanceJointDef();
    // Connection between previous particle and this one
    djd.bodyA = p1.body;
    djd.bodyB = p2.body;
    // Equilibrium length
    djd.length = box2d.scalarPixelsToWorld(len);
    
    // These properties affect how springy the joint is 
    djd.frequencyHz = 3;  // Try a value less than 5 (0 for no elasticity)
    djd.dampingRatio = 0.1; // Ranges between 0 and 1

    // Make the joint.  Note we aren't storing a reference to the joint ourselves anywhere!
    // We might need to someday, but for now it's ok
    DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
  }

  // Draw the bridge
  void display() {
    Vec2 pos1 = box2d.getBodyPixelCoord(p1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(p2.body);
    stroke(0);
    line(pos1.x,pos1.y,pos2.x,pos2.y);

    p1.display();
    p2.display();
  }
}
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<SomeShape> c;
Shape r;
float t=0;

void setup() {
  size(400, 300);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  r = new Shape();
  c = new ArrayList<SomeShape>();
}

void draw() {
  box2d.step();
  background(255);
  
  //Display the Chain Shape
  r.display();


  for (SomeShape c : c) {
    c.display();
  }
  SomeShape p = new SomeShape(width/2, 40);
  c.add(p);

  for (int i=c.size()-1; i>=0; i--) {
    SomeShape temp=c.get(i);
    if (temp.isDead())
      c.remove(i);
  }
}
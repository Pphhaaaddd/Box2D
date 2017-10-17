import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList<Pair> c;
Shape r;
float t=0;

void setup() {
  size(640, 480);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  r = new Shape();
  c = new ArrayList<Pair>();
}

void draw() {
  box2d.step();
  background(255);

  //Display the Chain Shape
  r.display();


  for (Pair c : c) {
    c.display();
  }
  if (mousePressed) {
    Pair p = new Pair(mouseX, mouseY);
    c.add(p);
  }

  //for (int i=c.size()-1; i>=0; i--) {
  //  Pair temp=c.get(i);
  //  if (temp.isDead())
  //    c.remove(i);
  //}
}
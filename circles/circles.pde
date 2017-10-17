import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Flower> c;
Shape r;
float t=0;

void setup() {
  size(1280, 720);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  r = new Shape();
  c = new ArrayList<Flower>();
}

void draw() {
  box2d.step();
  background(255);

  //Display the Chain Shape
  r.display();


  for (Flower c : c) {
    c.display();
  }
  if (mousePressed) {
    Flower p = new Flower(width/2, 40);
    c.add(p);
  }

  for (int i=c.size()-1; i>=0; i--) {
    Flower temp=c.get(i);
    if (temp.isDead())
      c.remove(i);
  }
}
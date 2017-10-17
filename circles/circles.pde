import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Circle> c;

void setup() {
  size(400, 300);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  c = new ArrayList<Circle>();
}

void draw() {
  box2d.step();

  background(255);
  for (Circle c : c) {
    c.display();
  }
  Circle p = new Circle(width/2, 40);
  c.add(p);

  for (int i=c.size()-1; i>=0; i--) {
    Circle temp=c.get(i);
    if (temp.isDead())
      c.remove(i);
  }
}
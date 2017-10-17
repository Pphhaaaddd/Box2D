class Circle {
  int size, lifespan=200;
  Body body;

  Circle(float x_, float y_) {

    size = int(random(20, 30));
    
    
    //Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));

    //Create Body
    body = box2d.createBody(bd);

    //Create Shape
    CircleShape ps=new CircleShape();
    float box2Dsize = box2d.scalarPixelsToWorld(size/2+1);
    ps.m_radius = box2Dsize;

    //Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;

    //Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    //5. Attach Shape to body with fixture
    body.createFixture(fd);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    lifespan --;
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(127, 127);
    stroke(50);
    rectMode(CENTER);
    ellipse(0, 0, size, size);
    popMatrix();
  }

  boolean isDead() {
    if (lifespan < 0)
      return true;
    return false;
  }
}
class Flower {
  int size, lifespan=10000;
  Body body;

  Flower(float x_, float y_) {

    size = 20;
    makeBody(x_, y_);
  }
  void makeBody(float x_, float y_) {
    //1. Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));

    //2. Create Body
    body = box2d.createBody(bd);

    //3. Create Shape

    //Petal 1
    CircleShape p1=new CircleShape();
    p1.m_radius = box2d.scalarPixelsToWorld(size/2);
    Vec2 offsetp1 = box2d.vectorPixelsToWorld(new Vec2(0, -size));
    p1.m_p.set(offsetp1.x, offsetp1.y);

    //Petal 2
    CircleShape p2=new CircleShape();
    p2.m_radius = box2d.scalarPixelsToWorld(size/2);
    Vec2 offsetp2 = box2d.vectorPixelsToWorld(new Vec2(-2*size/3, -size/3));
    p2.m_p.set(offsetp2.x, offsetp2.y);

    //Petal 3
    CircleShape p3=new CircleShape();
    p3.m_radius = box2d.scalarPixelsToWorld(size/2);
    Vec2 offsetp3 = box2d.vectorPixelsToWorld(new Vec2(2*size/3, -size/3));
    p3.m_p.set(offsetp3.x, offsetp3.y);

    //Stem
    PolygonShape s1=new PolygonShape();
    s1.setAsBox(box2d.scalarPixelsToWorld(size/4), box2d.scalarPixelsToWorld(size/1.5));

    //4. Create Fixture
    //FixtureDef fd = new FixtureDef();
    ////fd.shape = ps;

    //Parameters that affect physics
    //fd.density = 1;
    //fd.friction = 0.3;
    //fd.restitution = 0.5;

    //5. Attach Shape to body with fixture
    body.createFixture(p1, 1.0);
    body.createFixture(p2, 1.0);
    body.createFixture(p3, 1.0);
    body.createFixture(s1, 1.0);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();


    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    stroke(0);

    fill(255,255,0);
    ellipse(0, -size, size, size);
    ellipse(-size*2/3, -size/3, size, size);
    ellipse(size*2/3, -size/3, size, size);

    fill(127);
    rect(0, 0, size/2, size*2/1.5);    
    popMatrix();



    lifespan --;
  }

  boolean isDead() {
    if (lifespan < 0)
      return true;
    return false;
  }
}
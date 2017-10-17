class RigidShape {
  int w,h;
  Body body;

  RigidShape(float x_, float y_) {

    w = width/2;
    h = 10;
    makeBody(x_, y_);
  }
  void makeBody(float x_, float y_) {
    //Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));

    //Create Body
    body = box2d.createBody(bd);

    //Create Shape
    PolygonShape ps=new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw,box2Dh);

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

    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }

}
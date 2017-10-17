class SomeShape {
  int lifespan=10000;
  Body body;

  Vec2[] vertices;

  SomeShape(float x_, float y_) {
    vertices = new Vec2[5];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(0, -10));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-10, -2));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(-20, 5));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(5, 4));
    vertices[4] = box2d.vectorPixelsToWorld(new Vec2(5, -5));

    makeBody(x_, y_);
  }
  void makeBody(float x_, float y_) {
    //Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));

    //Create Body
    body = box2d.createBody(bd);

    //Create Shape
    PolygonShape ps=new PolygonShape();
    ps.set(vertices, vertices.length);

    //Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;

    //Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    //5. Attach Shape to body with fixture
    body.createFixture(fd);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    //Get the Polygonshape
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();


    lifespan --;
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(127, 127);
    stroke(50);
    beginShape();

    for (int i=0; i<ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }

  boolean isDead() {
    if (lifespan < 0)
      return true;
    return false;
  }
}
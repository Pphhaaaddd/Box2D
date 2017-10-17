class Shape {
  ArrayList<Vec2> surface;
  Body body;

  Shape() {
    int size=500;
    surface = new ArrayList<Vec2>();
    for (int i=0; i<size; i++) {
      surface.add(new Vec2(map(i,0,size,0,width), map(noise(PI*i/500),0,1,height*2/4,height*9/10)));
    }
    makeBody();
  }
  void makeBody() {
    // This is what box2d uses to put the surface in its world
    ChainShape chain = new ChainShape();

    // We can add 4 vertices by making an array of 4 Vec2 objects
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }

    chain.createChain(vertices, vertices.length);

    // The edge chain is now a body!
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    // Shortcut, we could define a fixture if we want to specify frictions, restitution, etc.
    body.createFixture(chain, 1);
  }

  void display() {
    strokeWeight(1);
    stroke(0);
    fill(0);
    beginShape();
    for (Vec2 v : surface) {
      vertex(v.x, v.y);
    }

    vertex(width, height);
    vertex(0, height);
    endShape();
  }
}
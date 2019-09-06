import peasy.PeasyCam;
PeasyCam cam;

float sphereRadius = 100;

void setup() {
  size(400, 400, P3D);
  pixelDensity(2);
  cam = new PeasyCam(this, 400);
}

void draw() {
  background(255);
  
  //translate(width/2, width/2, 0);  ///no need with peasyCam
  
  //stroke(0, 100);
  //noFill();
  //sphere(sphereRadius);

 
  stroke(255, 0, 0);
  noFill();
  //fill(255, 0, 0, 100);
  
  for(int i = 0; i < sphereRadius*2; i+=10){
     pushMatrix();
    float sphereCapradius = radiusSpeherCap(i, sphereRadius);
    rotateX(PI/2);
    translate( 0, 0, -sphereRadius+i);
    ellipse(0, 0, sphereCapradius*2, sphereCapradius*2);
    popMatrix();
  }
  
  
  //float r100 = radiusSpeherCap(10, sphereRadius);
  //rotateX(PI/2);
  //translate( 0, 0, -sphereRadius+10);
  //ellipse(0, 0, r100*2, r100*2);
  
}



///Calculate radius of spherical cap for given height
///Formula: a = sqrt(h(2R - h))
///--> http://mathworld.wolfram.com/SphericalCap.html
float radiusSpeherCap(float _h, float _R) {
  float a = 0.0;
  a = sqrt(_h*(2*_R - _h));
  return a;
}

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
  fill(255, 0, 0, 100);
  
  for(int i = 0; i < sphereRadius*2; i+=10){
    pushMatrix();
    float sphereCapradius = radiusSpeherCap(i, sphereRadius);
    rotateX(PI/2);
    translate( 0, 0, -sphereRadius+i);
    ellipse(0, 0, sphereCapradius*2, sphereCapradius*2);
    popMatrix();
  }
  
  noStroke();
  fill(0, 255, 0);
  
  for(float i = -sphereRadius; i < sphereRadius; i+=.1){
    float angle = map(i, 0, sphereRadius*2, 0, 10*TAU);
    PVector surfacePoint = pointOnSphere(i, sphereRadius, angle);
    pushMatrix();
    translate(surfacePoint.x, surfacePoint.y, surfacePoint.z);
    sphereDetail(4);
    sphere(1);
    popMatrix();
  }
  
  //float r100 = radiusSpeherCap(10, sphereRadius);
  //rotateX(PI/2);
  //translate( 0, 0, -sphereRadius+10);
  //ellipse(0, 0, r100*2, r100*2);
  
}



///Get a point on sphere-surface based on height, radius and angle
///use to calculate points defining the spiral
///--> https://en.wikipedia.org/wiki/Spherical_coordinate_system
///Formula:
/// PHI – Inclination Angle
/// Theta - Azimuth Angle
///x = r sin PHI cos THETA
///y = r sin PHI sin THETA
///z = r cos PHI
PVector pointOnSphere(float _h, float _R, float _angle){
  
  float phi = acos(_h/_R);
  float theta = _angle;
  
  float x = _R*sin(phi)*cos(theta);
  float z = _R*sin(phi)*sin(theta);
  float y = _R*cos(phi);
  PVector surfacePoint = new PVector(x, y, z);
  
  return surfacePoint;
}

///Calculate radius of spherical cap for given height
///Formula: a = sqrt(h(2R - h))
///--> http://mathworld.wolfram.com/SphericalCap.html
/// _R => sphere radius
float radiusSpeherCap(float _h, float _R) {
  float a = 0.0;
  a = sqrt(_h*(2*_R - _h));
  return a;
}

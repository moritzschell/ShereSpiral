import peasy.PeasyCam;
PeasyCam cam;

float sphereRadius = 100;
float rotationX = 0;

void setup() {
  size(400, 400, P3D);
  pixelDensity(2);
  //cam = new PeasyCam(this, 400);
}

void draw() {
  background(255);
  
  translate(width/2, width/2, 0);  ///no need with peasyCam
  
  rotateY(rotationX);
  
  noStroke();
  fill(0);
  
  for(float i = -sphereRadius; i < sphereRadius; i+=.1){
    float angle = map(i, 0, sphereRadius*2, 0, 10*TAU);
    PVector surfacePoint = pointOnSphere(i, sphereRadius, angle);
    pushMatrix();
    translate(surfacePoint.x, surfacePoint.y, surfacePoint.z);
    sphereDetail(4);
    sphere(1);
    popMatrix();
  }
  
  rotationX += .1;
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

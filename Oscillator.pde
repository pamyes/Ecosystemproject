class Oscillator {  
  // Because we are going to oscillate along the x and y axis we can use PVector for two angles, amplitudes, etc.!
  float theta;
  float amplitude;

  Oscillator(float r) {   
    // Initialize randomly
    theta = 0;
    amplitude = r;
  }
  // Update theta and offset
  void update(float thetaVel) {
    theta += thetaVel;
  }
}
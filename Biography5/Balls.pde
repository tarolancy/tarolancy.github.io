class Balls {

  int wordspacing = width  /9;
  float circleSize = 400;
  float radius = circleSize/2;
  int period = 5; //speed
  float x = 0;
  float particleY;
  float amplitude;
  float sineEl;
  float r = 0;
  String word;

  int randomPart[][] = new int[8][10];
  int partSize[][] = new int[8][10];


  void load() {
    for (int i = 0; i< 8; i++) {
      for (int j = 0; j < randomPart.length; j++) {
        randomPart[i][j] = int(random(100, 500));
        partSize[i][j] = int(random(20, 88));
      }
    }
  }

  void display() {

    x += 0.01;
    for (int i = 0; i< 8; i++) {
      for (int yRand = 0; yRand < randomPart.length; yRand++) { 

        particleY = randomPart[i][yRand];

        float sine = sin((2*PI*x)/period + randomPart[i][yRand]);
        amplitude = sqrt(sq(radius) - sq(abs(300 - particleY)));
        sineEl = wordspacing + sine * amplitude;

        float particleSize = partSize[i][yRand];
        sineEl += wordspacing *(i - 0.5);
        particleY += year1.y().get(i*4)- circleSize *3 /4 ;

        pushMatrix();
        translate(width/2, height/2);
        r += 0.005;
        translate(-width/2, -height/2);


        if (mouseX / wordspacing == i ) {
          stroke(155);
          noFill();
          ellipse(sineEl, particleY, particleSize, particleSize);
        }


        popMatrix();
      }
    }
  }
}
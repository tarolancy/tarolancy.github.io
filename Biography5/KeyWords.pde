class KeyWords {
  String name;
  String[] temp = new String[11];
  String[][] keys= new String[8][11];

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
  int randomPart1[][] = new int[8][10];
  int partSize[][] = new int[8][10];


  PFont myFont = createFont("字悦宋刻本(非商用).ttf", 50);




  void load(String name) {
    String[] lines = loadStrings(name );
    for (int i = 0; i < lines.length; i++) {
      String[] temp = split(lines[i], ',');
      for (int j = 0; j <11; j++) {
        keys[i][j] = temp[j];
      }
    }
    temp = null;
    for (int i = 0; i< 8; i++) {
      for (int j = 0; j < randomPart.length; j++) {
        randomPart[i][j] = 100 +40 *j;
        partSize[i][j] = int(random(22, 55));
      }
    }
  }

  void display() {

    textFont(myFont);

    x += 0.01;
    for (int i = 0; i< 8; i++) {
      for (int yRand = 0; yRand < randomPart.length; yRand++) { 

        word = keys[i][yRand+1];

        particleY = randomPart[i][yRand];

        float sine = sin((2*PI*x)/period + randomPart[i][yRand]);
        amplitude = sqrt(sq(radius) - sq(abs(300 - particleY)));
        sineEl = wordspacing + sine * amplitude;

        float particleSize = partSize[i][yRand];
        sineEl += wordspacing *(i - 0.5);
        particleY +=   year1.y().get(i*4)- circleSize *3 /4 ;

        pushMatrix();
        translate(width/2, height/2);
        r += 0.005;
        translate(-width/2, -height/2);

        textSize(particleSize );
        if (mouseX / wordspacing == i ) {
          //fill(62 +40 * yRand  , 195 - 5 * yRand ,  200 + 5 * yRand);
          fill(34);
          text(keys[i][yRand+1], sineEl, particleY);
        }
        //if (mouseX / wordspacing == i ) {
        // stroke(100);
        //noFill();
        //ellipse(sineEl, particleY, particleSize, particleSize);
        // }


        popMatrix();
      }
    }
  }
}
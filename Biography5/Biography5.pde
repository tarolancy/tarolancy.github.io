
Text memoir1;
Year year1;
KeyWords keywords1;
Balls balls1;


int value = 0;

void setup() {
  //fullScreen();
  size(3000,2000);
  background(245);
  memoir1 = new Text(); 
  year1 = new Year();
  keywords1 = new KeyWords();
  balls1 = new Balls();
  memoir1.load("Beethoven.txt");
  year1.load();
  keywords1.load("Keyword.txt");
  balls1.load();
}


void draw() {
  background(245);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      if (mouseX > 1800 && mouseY > 1800) {
        exit();
      } else {
        value = 1;
      }
    }
  }
  if ( value == 0) {
    memoir1.display(memoir1.tex(), 123, 123, 123);
    year1.display(233, 100, 123);
  } else {
    memoir1.display(memoir1.tex(), 222, 222, 222);
    memoir1.disappear(memoir1.tex(), 123, 123, 123);
    year1.Centralize(233, 100, 123);
    keywords1.display();
    balls1.display();
  }
}
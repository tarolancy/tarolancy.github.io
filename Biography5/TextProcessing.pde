class Text {

  int linespacing = (height +width)/ 70, letterspacing = (height +width)/ 90;
  int rCount = width/ letterspacing - 1;
  int n = 0;
  float oSize = (height +width)/ 155;
  FloatList x = new FloatList();
  FloatList y = new FloatList();
  FloatList x1 = new FloatList();
  FloatList y1 = new FloatList();
  String name;
  StringList text= new StringList();
  StringList text1 = new StringList();
  PFont myFont = createFont("字悦宋刻本(非商用).ttf", 32);



  void load(String name) {
    String[] lines = loadStrings(name );  
    textFont(myFont); 
    for (int i = 0; i < lines.length; i++) {
      for (int j = 0; j < lines[i].length(); j++) {
        text.append(lines[i].substring(j, j+1));
        n += 1;
      }
    }
    for (int i = 0; i <text.size()/ rCount; i++) {
      for (int j = 0; j< rCount; j++) {
        int n= i* rCount +j;
        text1.append(text.get(n));
        x.append(25+ letterspacing* j); 
        y.append(100+ linespacing * i);
        x1.append(25+ letterspacing* j); 
        y1.append(100+ linespacing * i);
      }
    }
  }



  void display(StringList slist, int r, int g, int b) {
    textFont(myFont); 
    fill(r, g, b);
    textSize(oSize);
    int n = 0;
    for (int i = 0; i < rCount; i++) {
      for (int j = 0; j< slist.size()/ rCount; j++) {
        text(slist.get(n ), x.get(n), y.get(n) );
        n += 1;
      }
    }
  }


  void disappear(StringList slist, int r, int g, int b) {
    textFont(myFont); 
    fill(r, g, b);
    textSize(oSize);
    //x = null;
    //y = null;
    for (int i = 0; i < x1.size(); i++) {
      x1.set(i, x1.get(i)+ random(-10, 10));
      y1.set(i, y1.get(i)+ random(-10, 10));
      y1.set(i, y1.get(i)* 1.1);
      if ( y1.min() > height) {
        break;
      }
    }
    int n = 0;
    for (int i = 0; i < rCount; i++) {
      for (int j = 0; j< slist.size()/ rCount; j++) {
        text(slist.get(n ), x1.get(n), y1.get(n) );
        n += 1;
        if ( y1.min() > height) {
          break;
        }
      }
    }
  }

  void delete() {
    x1 = null;
    y1 = null;  
    text1 = null;
  }

  StringList te() {
    return text;
  }

  StringList tex() {
    return text1;
  }

  FloatList x() {
    return x;
  }

  FloatList y() {
    return y;
  }
}
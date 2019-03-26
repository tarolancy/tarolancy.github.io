class Year {

  int letterspacing = (width+height)/ 90;
  int wordspacing = width  /9;
  float origenSize = (height +width)/ 155;
  float maxSize = (height +width)/60;
  float size = origenSize;
  boolean isUp[] = new boolean[32];
  FloatList x = new FloatList();
  FloatList y = new FloatList();
  FloatList x1 = new FloatList();
  FloatList y1 = new FloatList();
  StringList Year = new StringList();


  void load() {
    for (int i = 0; i < memoir1.te().size(); i++) {
      if (memoir1.te().get(i).matches("[0-9]+")) {
        Year.append(memoir1.te().get(i));
        x.append(memoir1.x().get(i));
        y.append(memoir1.y().get(i));
      }
    }
    for (int i = 0; i< Year.size()/4; i++) {
      for (int j = 0; j<  4; j++) {
        x1.append( wordspacing*(i +0.5) + letterspacing *j);
      }
    }
  }

  void display(int r, int g, int b) {
    fill(r, g, b);
    textSize(origenSize);
    for (int i = 0; i < Year.size(); i++) {
      text(Year.get(i ), x.get(i), y.get(i) );
    }
  }



  void Centralize(int r, int g, int b) {
    fill(r, g, b);
    for (int i = 0; i <50; i++ ) {
      if (size< maxSize) {
        size *= 1.001 ;
      } else {
        size = maxSize;
      }
      textSize(size);
    }
    for (int i = 0; i < Year.size(); i++) {      
      if (y.get(i)< height/2 - 400) {
        isUp[i] = true;
        y.set(i, y.get(i)* 1.01);
      } else if (y.get(i)> height/2 + 400) {
        isUp[i] = false;
        y.set(i, y.get(i)/ 1.01);
      }
      if (y.max() - y.min()<500) {
        y.set(0, y.get(1));
        break;
      }
    }
    for (int i = 0; i< Year.size(); i++) {
      if (isUp[i] == true) {
        y.set(i, y.get(i)*1.005 );
      } else {
        y.set(i, y.get(i)/1.005 );
      }
    }
    for (int i = 0; i <Year.size(); i++) {
      text(Year.get(i), x1.get(i), y.get(i) );
    }
  }


  StringList tex() {
    return(Year);
  }
  
  FloatList y(){
    return(y);
  }
  
}
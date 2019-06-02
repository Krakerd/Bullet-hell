/* 
RECT/RECT COLLISION FUNCTION
Jeff Thompson // v0.9 // November 2011 // www.jeffreythompson.org

Takes 8 arguments:
  + x,y position of object 1 - in this case "you"
  + width and height of object 1 - also "you"
  + x,y position of object 2 - in this case the static rectangle
  + width and height of object 2
  
*/
boolean rectRect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  
  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}
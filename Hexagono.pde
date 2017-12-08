interface forma{
void mostrar();
}
class hexagono implements forma{
float x,y,b,h,deltax,deltay,a;

hexagono(float x_, float y_, float b_,float h_){
x=x_;
y=y_;
b=b_;
h=h_;
}
  
  void mostrar(){
    
  beginShape();
  deltax=x+b/4;
  vertex(deltax,y);
  vertex(deltax+b/2,y);
  vertex(deltax+3*b/4,y-h/2);
  vertex(deltax+b/2,y-h);
  vertex(x+b/4,y-h);
  vertex(x,y-h/2);
  vertex(deltax,y);
     
  endShape(CLOSE);
  }//fin vertice 
}//fin clase
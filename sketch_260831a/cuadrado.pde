class cuadrado {
  PVector pos;
  float ancho;
  float alto;
  float velocidadX = -3; 

  cuadrado(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    ancho = w;
    alto = h;
  }

  void mover() {
    pos.x += velocidadX;
  }

  void mostrar() {
    fill(40, 180, 40); 
    stroke(0);
    strokeWeight(2);
    rect(pos.x, pos.y, ancho, alto);
  }
}

class Pelota {
  PVector pos;
  PVector vel;
  PVector acel;
  float radio;
  float fuerzaSalto = -7.5; 

  Pelota(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acel = new PVector(0, 0);
    radio = 16; 
  }

  void addFuerza(PVector fuerza) {
    acel.add(fuerza);
  }

  void mover() {
    vel.add(acel);
    pos.add(vel);
    acel.mult(0); 
    
    if (pos.y < radio) {
      pos.y = radio;
      vel.y = 0;
    }
  }

  void saltar() {
    vel.y = fuerzaSalto; 
  }

  void mostrar() {
    fill(255, 220, 0); 
    stroke(0);
    strokeWeight(2);
    circle(pos.x, pos.y, radio * 2);
  }
}

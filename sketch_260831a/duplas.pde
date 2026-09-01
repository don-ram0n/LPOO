class dupla {
  cuadrado sup, inf;
  boolean pasado = false; 
  
  boolean seMueveVertical = false; 
  float angulo; 
  float velocidadOscilacion; 
  float amplitudOscilacion;  

  dupla(PVector pos_m, int puntosActuales) {
    float anchoTubo = 60;
    float espacioEntreTubos = 160; 
    float alturaMinima = 120; 
    
    float altoSuperior = random(alturaMinima, height - espacioEntreTubos - alturaMinima);
    float altoInferior = height - altoSuperior - espacioEntreTubos;
    
    sup = new cuadrado(pos_m.x, pos_m.y, anchoTubo, altoSuperior);
    inf = new cuadrado(pos_m.x, height - altoInferior, anchoTubo, altoInferior);
    
    if (puntosActuales >= 3) {
  
      if (random(1) < 0.65) {
        seMueveVertical = true;
        angulo = random(TWO_PI); 
        velocidadOscilacion = random(0.02, 0.05); 
        amplitudOscilacion = random(1.5, 3.0);    
      }
    }
  }

  void mover() {
    sup.mover();
    inf.mover();
    
    if (seMueveVertical) {
      float cambioY = sin(angulo) * amplitudOscilacion;
      angulo += velocidadOscilacion;
      
      sup.alto += cambioY;
      inf.pos.y += cambioY;
      inf.alto -= cambioY;
    }
  }

  void mostrar() {
    sup.mostrar();
    inf.mostrar();
  }
}

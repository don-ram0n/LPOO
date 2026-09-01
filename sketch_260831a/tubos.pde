void AgregarTubos() {
  float tActual = millis();
  float dt = tActual - ultimoPar;
  
  if (dt > 2500) { 
    tubos.add(new dupla(new PVector(width, 0), puntos));
    ultimoPar = tActual;
  }
}

void borrarTubos() {
  for (int i = tubos.size() - 1; i >= 0; i--) {
    dupla aux = tubos.get(i);
    if (aux.sup.pos.x + aux.sup.ancho < 0) {
      tubos.remove(i);
    }
  }
}

void reiniciarJuego() {
  tubos.clear();
  bird = new Pelota(100, height/2);
  ultimoPar = millis();
  puntos = 0;
}

boolean comprobarColision(Pelota p, cuadrado c) {
  float cercaX = max(c.pos.x, min(p.pos.x, c.pos.x + c.ancho));
  float cercaY = max(c.pos.y, min(p.pos.y, c.pos.y + c.alto));
  
  float distanciaX = p.pos.x - cercaX;
  float distanciaY = p.pos.y - cercaY;
  
  float distanciaCuadrada = (distanciaX * distanciaX) + (distanciaY * distanciaY);
  return distanciaCuadrada < (p.radio * p.radio);
}

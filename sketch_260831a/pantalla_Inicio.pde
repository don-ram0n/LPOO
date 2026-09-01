void mostrarPantallaInicio() {
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(50);
  text("FLAPPY BIRD", width/2, height/2 - 50);
  
  textSize(24);
  fill(0, 100, 0);
  text("Presiona ESPACIO para iniciar", width/2, height/2 + 30);
}

void mostrarPantallaGameOver() {
  bird.mostrar();
  for (dupla d : tubos) {
    d.mostrar();
  }

  fill(0, 0, 0, 150);
  rect(0, 0, width, height);
  
  textAlign(CENTER, CENTER);
  fill(255, 50, 50);
  textSize(60);
  text("GAME OVER", width/2, height/2 - 60);
  
  fill(255);
  textSize(30);
  text("Puntos obtenidos: " + puntos, width/2, height/2 + 10);
  
  textSize(20);
  fill(200);
  text("Presiona ESPACIO para volver a jugar", width/2, height/2 + 80);
}

void actualizarJuego() {
  AgregarTubos();
  
  bird.addFuerza(G);
  bird.mover();
  bird.mostrar();
  
  for (int i = tubos.size() - 1; i >= 0; i--) {
    dupla d = tubos.get(i);
    d.mover();
    d.mostrar();
    
    // Control del puntaje mediante la dupla
    if (!d.pasado && d.sup.pos.x + d.sup.ancho < bird.pos.x) {
      d.pasado = true;
      puntos += 1; 
    }
    
    // Comprobar colisión contra el tubo superior o el inferior de la dupla
    if (comprobarColision(bird, d.sup) || comprobarColision(bird, d.inf)) {
      estado = 2; 
    }
  }

  if (bird.pos.y >= height - bird.radio) {
    estado = 2;
  }
  
  borrarTubos();

  textAlign(LEFT, TOP);
  fill(255);
  textSize(30);
  text("Puntos: " + puntos, 20, 20); 
}

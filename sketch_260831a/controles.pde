void keyPressed() {
  if (key == ' ') {
    if (estado == 0) {
      estado = 1; 
    } 
    else if (estado == 1) {
      bird.saltar(); 
    } 
    else if (estado == 2) {
      reiniciarJuego(); 
      estado = 1;
    }
  }
}

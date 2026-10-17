class Trabajo {
  String cliente;
  String video;
  double precio;
  bool terminado;

  Trabajo(this.cliente, this.video, this.precio, this.terminado);

  void mostrar() {
    String estado = terminado ? 'Terminado' : 'Pendiente';
    print('Cliente: $cliente | Video: $video | Precio: \$$precio | Estado: $estado');
  }
}

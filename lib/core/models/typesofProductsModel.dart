String determinaImagen(nombreProducto) {
  String CBN = 'assets/producto/pacena.jpg';
  String HUARI = 'assets/producto/huari.jpeg';
  String TAQUINAPILSENER = 'assets/producto/taquinaPilsener.jpeg';
  String TAQUINAEXPORT = 'assets/producto/taquinaExport.jpeg';
  String xDefecto = 'assets/producto/xdefecto2.jpg';

  if(nombreProducto=='CBN'){
    return CBN;
  }
  if(nombreProducto=='HUARI'){
    return HUARI;
  }
  if(nombreProducto=='TAQUIÑA PILSENER'){
    return TAQUINAPILSENER;
  }
  if(nombreProducto=='TAQUIÑA EXPORT'){
    return TAQUINAEXPORT;
  }
  else{
    return xDefecto;
  }
}

class Troqueladora {
  String id;
  String nombreProducto;
  String maquinaria;
  String fechaTrabajo;
  int produccion;
  int tapasMalas;
  String responsable;
  String turno;

  Troqueladora({this.id, this.nombreProducto, this.maquinaria,this.fechaTrabajo,this.produccion,this.tapasMalas, this.responsable,this.turno});

  Troqueladora.fromMap(Map snapshot,String id) :
        id = id ?? '',
        nombreProducto = snapshot['nombreProducto'] ?? '',
        maquinaria = snapshot['maquinaria'] ?? '',
        fechaTrabajo = snapshot['fechaTrabajo'] ?? '',
        produccion = snapshot['produccion'] ?? '',
        tapasMalas = snapshot['tapasMalas'] ?? '',
        responsable = snapshot['responsable'] ?? '',
        turno = snapshot['turno'] ?? '';

  toJson() {
    return {
      "nombreProducto": nombreProducto,
      "maquinaria": maquinaria,
      "fechaTrabajo": fechaTrabajo,
      "produccion": produccion,
      "tapasMalas": tapasMalas,
      "responsable": responsable,
      "turno": turno,
    };
  }
}
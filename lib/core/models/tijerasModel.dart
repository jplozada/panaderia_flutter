
import 'package:cloud_firestore/cloud_firestore.dart';

class Tijeras {
  String id;
  Timestamp fechaTrabajo;
  String turno;
  String producto;
  int lote;
  int hojas;
  String trabajo;
  String rechazoLitografia;
  String responsable;

  Tijeras({this.id,this.fechaTrabajo,this.turno,this.producto,this.lote,this.hojas,this.trabajo,this.rechazoLitografia,this.responsable});

  Tijeras.fromMap(Map snapshot,String id) :
        id = id ?? '',
        fechaTrabajo = snapshot['fechaTrabajo'] ?? '',
        turno = snapshot['turno'] ?? '',
        producto = snapshot['producto'] ?? '',
        lote = snapshot['lote'] ?? '',
        hojas = snapshot['hojas'] ?? '',
        trabajo = snapshot['trabajo'] ?? '',
        rechazoLitografia = snapshot['rechazoLitografia'] ?? '',
        responsable = snapshot['responsable'] ?? '';

  toJson() {
    return {
      "fechaTrabajo": fechaTrabajo,
      "turno": turno,
      "producto": producto,
      "lote": lote,
      "hojas": hojas,
      "trabajo": trabajo,
      "rechazoLitografia": rechazoLitografia,
      "responsable": responsable,
    };
  }
}
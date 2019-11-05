
import 'package:cloud_firestore/cloud_firestore.dart';

class Ensamblaje {
  String id;
  Timestamp fechaTrabajo;
  String turno;
  String producto;
  int cajas;
  int tapas;
  String maquinista;
  int sinPvc;
  int conPvc;
  String maquina;
  String responsable;

  Ensamblaje({this.id,this.fechaTrabajo,this.turno,this.producto,this.cajas,this.tapas,this.maquinista,this.sinPvc,this.conPvc,this.maquina,this.responsable});

  Ensamblaje.fromMap(Map snapshot,String id) :
        id = id ?? '',
        fechaTrabajo = snapshot['fechaTrabajo'] ?? '',
        turno = snapshot['turno'] ?? '',
        producto = snapshot['producto'] ?? '',
        cajas = snapshot['cajas'] ?? '',
        tapas = snapshot['tapas'] ?? '',
        maquinista = snapshot['maquinista'] ?? '',
        sinPvc = snapshot['sinPvc'] ?? '',
        conPvc = snapshot['conPvc'] ?? '',
        maquina = snapshot['maquina'] ?? '',
        responsable = snapshot['responsable'] ?? '';

  toJson() {
    return {
      "fechaTrabajo": fechaTrabajo,
      "turno": turno,
      "producto": producto,
      "cajas": cajas,
      "tapas": tapas,
      "maquinista": maquinista,
      "sinPvc": sinPvc,
      "conPvc": conPvc,
      "maquina": maquina,
      "responsable": responsable,
    };
  }
}
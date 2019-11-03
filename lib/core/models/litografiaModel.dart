
import 'package:cloud_firestore/cloud_firestore.dart';

class Litografia {
  String id;
  Timestamp fechaTrabajo;
  String horaTrabajo;
  String turno;
  String producto;
  String cliente;
  String trabajo;
  int hojasProducidas;
  int hojasAProducir;
  String materiaPrima;
  String observacion;

  Litografia({this.id,this.fechaTrabajo,this.horaTrabajo,this.turno,this.producto,this.cliente,this.trabajo,this.hojasProducidas,this.hojasAProducir,this.materiaPrima,this.observacion});

  Litografia.fromMap(Map snapshot,String id) :
        id = id ?? '',
        fechaTrabajo = snapshot['fechaTrabajo'] ?? '',
        horaTrabajo = snapshot['horaTrabajo'] ?? '',
        turno = snapshot['turno'] ?? '',
        producto = snapshot['producto'] ?? '',
        cliente = snapshot['cliente'] ?? '',
        trabajo = snapshot['trabajo'] ?? '',
        hojasProducidas = snapshot['hojasProducidas'] ?? '',
        hojasAProducir = snapshot['hojasAProducir'] ?? '',
        materiaPrima = snapshot['materiaPrima'] ?? '',
        observacion = snapshot['observacion'] ?? '';

  toJson() {
    return {
      "fechaTrabajo": fechaTrabajo,
      "horaTrabajo": horaTrabajo,
      "turno": turno,
      "producto": producto,
      "cliente": cliente,
      "trabajo": trabajo,
      "hojasProducidas": hojasProducidas,
      "hojasAProducir": hojasAProducir,
      "materiaPrima": materiaPrima,
      "observacion": observacion,
    };
  }
}
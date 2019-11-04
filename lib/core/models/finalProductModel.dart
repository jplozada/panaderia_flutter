
class FinalProduct {
//class Inventory {
  String id;
  String tipoPVC;
  String nombre;
  String hora;
  String fecha;
  String estado;
  String cliente;
  int cantidad;

  FinalProduct({this.id,this.tipoPVC , this.nombre, this.hora,this.fecha,this.estado,this.cliente,this.cantidad});
//  Inventory({this.id, this.nombre, this.cantTotal,this.cantSalida,this.cantEntrada});

  FinalProduct.fromMap(Map snapshot,String id) :
//  Inventory.fromMap(Map snapshot,String id) :
        id = id ?? '',
        tipoPVC = snapshot['tipoPVC'] ?? '',
        nombre = snapshot['nombre'] ?? '',
        hora = snapshot['hora'] ?? '',
        fecha = snapshot['fecha'] ?? '',
        estado = snapshot['estado'] ?? '',
        cliente = snapshot['cliente'] ?? '',
        cantidad = snapshot['cantidad'] ?? '';
//        id = id ?? '',
//        nombre = snapshot['nombre'] ?? '',
//        cantTotal = snapshot['cantTotal'] ?? '',
//        cantSalida = snapshot['cantSalida'] ?? '',
//        cantEntrada = snapshot['cantEntrada'] ?? '';

//        para el nuevo proyecto

  toJson() {
    return {
      "tipoPVC": tipoPVC,
      "nombre": nombre,
      "hora": hora,
      "fecha": fecha,
      "estado": estado,
      "cliente": cliente,
      "cantidad": cantidad,
//      "nombre": nombre,
//      "cantTotal": cantTotal,
//      "cantSalida": cantSalida,
//      "cantEntrada": cantEntrada,

//      para el nuevo proyecto
    };
  }
}
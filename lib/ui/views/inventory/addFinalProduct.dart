import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:panaderia_flutter/core/models/finalProductModel.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodels/CRUDModelFinalProduct.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddFinalProduct extends StatefulWidget {
  @override
  _AddFinalProductState createState() => _AddFinalProductState();
}

class _AddFinalProductState extends State<AddFinalProduct> {
  final _formKey = GlobalKey<FormState>();
  String _counter, _value = "Presione el boton para escanear";
  Future _incrementCounter() async {
    _counter = await FlutterBarcodeScanner.scanBarcode(
        "#004297", "Cancel", true, ScanMode.DEFAULT);
    setState(() {
      _value = _counter;
      nombre = _value;
    });
  }

  String tipoPVC;
  String nombre;
  String hora;
  String fecha;
  String estado;
  String cliente;
  String cantidad;

  ////////////////////////////////////////////
//  para el drop box para el Estado
  List _Estado = [
    "En Almacen",
    "Entregado",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItemsEstado;
  String _currentEstado;

//  @override
//  void initState() {
//    _dropDownMenuItemsEstado = getDropDownMenuItems();
//    _currentEstado = _dropDownMenuItemsEstado[0].value;
//    super.initState();
//  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsEstado() {
    List<DropdownMenuItem<String>> items = new List();
    for (String estado in _Estado) {
      items.add(new DropdownMenuItem(value: estado, child: new Text(estado)));
    }
    return items;
  }

  void changedDropDownItemEstado(String selectedEstado) {
    setState(() {
      _currentEstado = selectedEstado;
      print(_currentEstado);
    });
  }

///////////////////////////////////////////////

  ////////////////////////////////////////////
//  para el drop box para el PVC
  List _PVC = [
    "Tipo PVC",
    "PVC plastisol",
    "PVC fondo oscuro",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentPVC;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentPVC = _dropDownMenuItems[0].value;

    _dropDownMenuItemsEstado = getDropDownMenuItemsEstado();//para es estado
    _currentEstado = _dropDownMenuItemsEstado[0].value;//para el estado
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String PVC in _PVC) {
      items.add(new DropdownMenuItem(value: PVC, child: new Text(PVC)));
    }
    return items;
  }

  void changedDropDownItemPVC(String selectedPVC) {
    setState(() {
      _currentPVC = selectedPVC;
      print(_currentPVC);
    });
  }

///////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDModelFinalProduct>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text(_value),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          onPressed: _incrementCounter,
                          child: Text(
                            "Leer QR",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: <Widget>[
                    TextFormField(
                      //keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nombre del Cliente',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Introduzca la cantidad total';
                        }
                      },
                      onSaved: (value) => cliente = value,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Numero de Cajas',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Introduzca la canatida de Nuemro de Cajas';
                        }
                      },
                      onSaved: (value) => cantidad = value,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text("Estado del Producto",
                    style: TextStyle(fontWeight: FontWeight.w600,
//                      fontSize: 25,
                      color: Colors.blueAccent,),),
                    SizedBox(
                      height: 16,
                    ),
                    DropdownButton(
//                    iconEnabledColor: Colors.amberAccent,
//                    iconDisabledColor: Colors.blue,
                      style: TextStyle(
//                      fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.black,
//                      backgroundColor: Colors.grey[300],
                      ),
                      value: _currentEstado,
                      items: _dropDownMenuItemsEstado,
                      onChanged: changedDropDownItemEstado,
                    ),
//                    TextFormField(
////                keyboardType: TextInputType.numberWithOptions(),
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText: 'Tipo PVC',
//                        fillColor: Colors.grey[300],
//                        filled: true,
//                      ),
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Introduzca el Tipo de PVC';
//                        }
//                      },
//                      onSaved: (value) => tipoPVC = value,
//                    ),
                    SizedBox(
                      height: 25,
                    ),
                    DropdownButton(
//                    iconEnabledColor: Colors.amberAccent,
//                    iconDisabledColor: Colors.blue,
                      style: TextStyle(
//                      fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black,
//                      backgroundColor: Colors.grey[300],
                      ),
                      value: _currentPVC,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItemPVC,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      splashColor: Colors.red,
                      onPressed: () async {
                        estado = _currentEstado;
                        tipoPVC = _currentPVC;
                        fecha = new DateFormat.yMd().format(new DateTime.now());
                        hora = new DateFormat.Hms().format(new DateTime.now());
                        print(_currentPVC);
                        print(fecha);
                        print(hora);
                        if (_currentPVC == 'Tipo PVC' || _currentPVC == '') {
                          Fluttertoast.showToast(
                              msg: "Debe Seleccionar el Tipo de PVC.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1);
                        } else {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            await productProvider.addProduct(
                              FinalProduct(
                                tipoPVC: tipoPVC,
                                nombre: nombre,
                                hora: hora,
                                fecha: fecha,
                                estado: estado,
                                cliente: cliente,
                                cantidad: int.parse(cantidad),
                              ),
                            );
//                  "tipoPVC": tipoPVC,
//                  "nombre": nombre,
//                  "hora": hora,
//                  "fecha": fecha,
//                  "estado": estado,
//                  "cliente": cliente,
//                  "cantidad": cantidad,
                            Navigator.pushNamed(context, '/readFinalProduct');
                          }
                        }
                      },
                      child: Text('Añadir registro',
                          style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

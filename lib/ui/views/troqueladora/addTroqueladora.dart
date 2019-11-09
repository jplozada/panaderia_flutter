import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panaderia_flutter/core/models/troqueladoraModel.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodels/CRUDModelTroqueladora.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddTroqueladora extends StatefulWidget {
  @override
  _AddTroqueladoraState createState() => _AddTroqueladoraState();
}

class _AddTroqueladoraState extends State<AddTroqueladora> {
  final _formKey = GlobalKey<FormState>();
//  String _counter,_value = "Presione el boton para escanear";
//  Future _incrementCounter() async{
//    _counter= await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true, ScanMode.DEFAULT);
//    setState(() {
//      _value=_counter;
//      nombreProducto = _value;
//    });
//  }

//  String id;
  String nombreProducto;
  String maquinaria;
  String fechaTrabajo;
  String produccion;
  String tapasMalas;
  String responsable;
  String turno;

  ////////////////////////////////////////////
//  para el drop box para el Estado
  List _Responsable = [
    "Fabio",
    "Marcos",
    "Gabriel",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItemsResponsable;
  String _currentResponsable;

//  @override
//  void initState() {
//    _dropDownMenuItemsResponsable = getDropDownMenuItems();
//    _currentResponsable = _dropDownMenuItemsResponsable[0].value;
//    super.initState();
//  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsResponsable() {
    List<DropdownMenuItem<String>> items = new List();
    for (String responsable in _Responsable) {
      items.add(new DropdownMenuItem(value: responsable, child: new Text(responsable)));
    }
    return items;
  }

  void changedDropDownItemResponsable(String selectedResponsable) {
    setState(() {
      _currentResponsable = selectedResponsable;
      print(_currentResponsable);
    });
  }

///////////////////////////////////////////////
  ////////////////////////////////////////////
//  para el drop box para el Estado
  List _Producto = [
    'CBN',
    'HUARI',
    'TAQUIÑA PILSENER',
    'TAQUIÑA EXPORT',
    'DUCAL',
    'PACEÑA ICE',
    'MALTIN',
    'EL INCA',
    'IMPERIAL',
    'PACEÑA 710',
    'PACEÑA CENTENARIO',
    'FRUTAL MANZANA',
    'FRUTAL DURAZNO',
    'HUARI CON MIEL',
    'HUARI CON QUINUA',
    'POTOSINA LIGHT',
    'POTOSINA PILSENER',
    'AUTENTICA',
    'MALTA REAL',
    'CORDILLERA',
    'CERVEZA REAL',
    'PACEÑA BLACK',
    'HUARI D.N.',
    'CASCADA L.P.',
    'CASCADA SUR',
    'TAQUIÑA CHICA',
    'SODA POPULAR',
    'COCA COLA',
    'COMRURAL XXI',
    'JUDAS',
    'ULTRA',
    'DURAZCO DEL VALLE',
    'MANZANA DEL VALLE',
    'PIÑA DEL VALLE',
    'FRESA DEL VALLE',
    'LISAS RECUPERADAS',
    'HOJAS RECUPERADAS',
    'HOJAS VIRGEN',
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItemsProducto;
  String _currentProducto;

  @override
  void initState() {
    _dropDownMenuItemsProducto = getDropDownMenuItemsProducto();
    _currentProducto = _dropDownMenuItemsProducto[0].value;

    _dropDownMenuItemsMaquinaria = getDropDownMenuItemsMaquinaria();
    _currentMaquinaria = _dropDownMenuItemsMaquinaria[0].value;

    _dropDownMenuItemsTurno = getDropDownMenuItemsTurno();
    _currentTurno = _dropDownMenuItemsTurno[0].value;

    _dropDownMenuItemsResponsable = getDropDownMenuItemsResponsable();
    _currentResponsable = _dropDownMenuItemsResponsable[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsProducto() {
    List<DropdownMenuItem<String>> items = new List();
    for (String producto in _Producto) {
      items.add(
          new DropdownMenuItem(value: producto, child: new Text(producto)));
    }
    return items;
  }

  void changedDropDownItemProducto(String selectedProducto) {
    setState(() {
      _currentProducto = selectedProducto;
      print(_currentProducto);
    });
  }

///////////////////////////////////////////////
  ////////////////////////////////////////////
//  para el drop box para el Estado
  List _Maquinaria = [
    "PTC-105",
    "PTC-110",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItemsMaquinaria;
  String _currentMaquinaria;

//  @override
//  void initState() {
//    _dropDownMenuItemsEstado = getDropDownMenuItemsEstado();
//    _currentEstado = _dropDownMenuItemsEstado[0].value;
//    super.initState();
//  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsMaquinaria() {
    List<DropdownMenuItem<String>> items = new List();
    for (String maquinaria in _Maquinaria) {
      items.add(
        new DropdownMenuItem(
          value: maquinaria,
          child: new Text(maquinaria),
        ),
      );
    }
    return items;
  }

  void changedDropDownItemMaquinaria(String selectedMaquinaria) {
    setState(() {
      _currentMaquinaria = selectedMaquinaria;
      print(_currentMaquinaria);
    });
  }

///////////////////////////////////////////////
  ////////////////////////////////////////////
//  para el drop box para el Estado
  List _Turno = [
    "1er turno",
    "2do turno",
    "3er turno",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItemsTurno;
  String _currentTurno;

//  @override
//  void initState() {
//    _dropDownMenuItemsTurno = getDropDownMenuItemsTurno();
//    _currentTurno = _dropDownMenuItemsTurno[0].value;
//    super.initState();
//  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsTurno() {
    List<DropdownMenuItem<String>> items = new List();
    for (String turno in _Turno) {
      items.add(new DropdownMenuItem(value: turno, child: new Text(turno)));
    }
    return items;
  }

  void changedDropDownItemTurno(String selectedTurno) {
    setState(() {
      _currentTurno = selectedTurno;
      print(_currentTurno);
    });
  }

///////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDModelTroqueladora>(context);
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
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      flex: 3,
//                      child: Text(_value),
//                    ),
//                    Expanded(
//                      flex: 1,
//                      child: RaisedButton(
//                      onPressed: _incrementCounter,
//                      child: Text("Leer QR", style: TextStyle(color: Colors.white),),
//                      color: Colors.blue,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
                SizedBox(
                  height: 16,
                ),

                Container(
                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Nombre del producto",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                DropdownButton(
                  isExpanded: true,
//                    iconEnabledColor: Colors.amberAccent,
//                    iconDisabledColor: Colors.blue,
                  style: TextStyle(
//                      fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
//                      backgroundColor: Colors.grey[300],
                  ),
                  value: _currentProducto,
                  items: _dropDownMenuItemsProducto,
                  onChanged: changedDropDownItemProducto,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Maquinaria:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DropdownButton(
//                    iconEnabledColor: Colors.amberAccent,
//                    iconDisabledColor: Colors.blue,
                      style: TextStyle(
//                      fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
//                      backgroundColor: Colors.grey[300],
                      ),
                      value: _currentMaquinaria,
                      items: _dropDownMenuItemsMaquinaria,
                      onChanged: changedDropDownItemMaquinaria,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Turno:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DropdownButton(
//                    iconEnabledColor: Colors.amberAccent,
//                    iconDisabledColor: Colors.blue,
                      style: TextStyle(
//                      fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
//                      backgroundColor: Colors.grey[300],
                      ),
                      value: _currentTurno,
                      items: _dropDownMenuItemsTurno,
                      onChanged: changedDropDownItemTurno,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Produccion de Hojas Traqueladas:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cantidad Produccion',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca la cantidad de hojas traqueladas';
                    }
                  },
                  onSaved: (value) => produccion = value,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tapas Malas, Desperdicio:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cantidad Desperdicio',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca la cantidad de tapas malas';
                    }
                  },
                  onSaved: (value) => tapasMalas = value,
                ),
                SizedBox(
                  height: 16,
                ),Container(
                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Responsable:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
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
                  value: _currentResponsable,
                  items: _dropDownMenuItemsResponsable,
                  onChanged: changedDropDownItemResponsable,
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  splashColor: Colors.red,
                  onPressed: () async {
                    nombreProducto = _currentProducto;
                    maquinaria = _currentMaquinaria;
                    responsable = _currentResponsable;
                    turno = _currentTurno;
                    fechaTrabajo = new DateFormat.yMd().format(new DateTime.now()) + ' ' + new DateFormat.Hms().format(new DateTime.now());
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      await productProvider.addProduct(Troqueladora(
                          nombreProducto: nombreProducto,
                          maquinaria: maquinaria,
                          fechaTrabajo: fechaTrabajo,
                          produccion: int.parse(produccion),
                          tapasMalas: int.parse(tapasMalas),
                          responsable: responsable,
                          turno: turno));
                      Navigator.pushNamed(context, '/readTroqueladora');
                    }
                  },
                  child: Text('Añadir registro',
                      style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

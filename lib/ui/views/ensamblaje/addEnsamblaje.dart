import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/ensamblajeModel.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodels/CRUDModelEnsamblaje.dart';

class TimeValue {
  final int _key;
  final String _value;
  TimeValue(this._key, this._value);
}

class AddEnsamblaje extends StatefulWidget {
  @override
  _AddEnsamblajeState createState() => _AddEnsamblajeState();
}

class _AddEnsamblajeState extends State<AddEnsamblaje> {
  final _formKey = GlobalKey<FormState>();
  //Dropdownbutton value1
  var _value1 = ['1er turno', '2do turno'];
  var _value1Selected = '1er turno';
  //Dropdownbutton value2
  var _value2 = [
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
  var _value2Selected = 'CBN';
  //Dropdownbutton value3
  var _value3 = ['David', 'Hector'];
  var _value3Selected = 'David';
  //Dropdownbutton value4
  var _value4 = ['PMC-250', 'INC-100'];
  var _value4Selected = 'PMC-250';
  //Dropdownbutton value5
  var _value5 = ['Zenobia', 'Anahi'];
  var _value5Selected = 'Zenobia';

  String id;
  Timestamp fechaTrabajo;
  String turno;
  String producto;
  String cajas;
  String tapas;
  String maquinista;
  String sinPvc;
  String conPvc;
  String maquina;
  String responsable;

  @override
  Widget build(BuildContext context) {
    DateTime fechaActual = DateTime.now();
    Timestamp fechaActualFirebase = Timestamp.now();
    fechaTrabajo = fechaActualFirebase;
    var productProvider = Provider.of<CRUDModelEnsamblaje>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Añadir registro'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Fecha trabajo"),
                                Text(
                                  "${fechaActual.year}-${fechaActual.month}-${fechaActual.day}",
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Turno"),
                                DropdownButton<String>(
                                  items:
                                      _value1.map((String dropDownStringItem) {
                                    turno = _value1Selected;
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue1) {
                                    _onChangedValue1(newValue1);
                                    turno = newValue1;
                                  },
                                  value: _value1Selected,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Producto"),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  items:
                                      _value2.map((String dropDownStringItem) {
                                    producto = _value2Selected;
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue2) {
                                    _onChangedValue2(newValue2);
                                    producto = newValue2;
                                  },
                                  value: _value2Selected,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Tapas, desperdicio"),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Cajas"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) => cajas = value),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Tapas"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) => tapas = value),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Maquinista"),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  items:
                                      _value3.map((String dropDownStringItem) {
                                    maquinista = _value3Selected;
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue3) {
                                    _onChangedValue3(newValue3);
                                    maquinista = newValue3;
                                  },
                                  value: _value3Selected,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Sin Pvc"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) => sinPvc = value),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Con Pvc"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) => conPvc = value),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Maquina"),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  items:
                                      _value4.map((String dropDownStringItem) {
                                    maquina = _value4Selected;
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue4) {
                                    _onChangedValue4(newValue4);
                                    maquina = newValue4;
                                  },
                                  value: _value4Selected,
                                ),
                              ],
                            ),
                          )
                        ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Responsable"),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  items:
                                      _value5.map((String dropDownStringItem) {
                                    responsable = _value5Selected;
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue5) {
                                    _onChangedValue5(newValue5);
                                    responsable = newValue5;
                                  },
                                  value: _value5Selected,
                                ),
                              ],
                            ),
                          )
                        ),
                    ],
                  ),
                  RaisedButton(
                    splashColor: Colors.red,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        await productProvider.addProduct(Ensamblaje(
                            fechaTrabajo: fechaTrabajo,
                            turno: turno,
                            producto: producto,
                            cajas: int.parse(cajas),
                            tapas: int.parse(tapas),
                            maquinista: maquinista,
                            sinPvc: int.parse(sinPvc),
                            conPvc: int.parse(conPvc),
                            maquina: maquina,
                            responsable: responsable));
                        Navigator.pushNamed(context, '/readEnsamblaje');
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
        ));
  }

  void _onChangedValue1(String newValue1) {
    setState(() {
      this._value1Selected = newValue1;
    });
  }

  void _onChangedValue2(String newValue2) {
    setState(() {
      this._value2Selected = newValue2;
    });
  }

  void _onChangedValue3(String newValue3) {
    setState(() {
      this._value3Selected = newValue3;
    });
  }
  
  void _onChangedValue4(String newValue4) {
    setState(() {
      this._value4Selected = newValue4;
    });
  }

  void _onChangedValue5(String newValue5) {
    setState(() {
      this._value5Selected = newValue5;
    });
  }
}
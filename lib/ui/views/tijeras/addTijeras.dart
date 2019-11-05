import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/tijerasModel.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodels/CRUDModelTijeras.dart';

class TimeValue {
  final int _key;
  final String _value;
  TimeValue(this._key, this._value);
}

class AddTijeras extends StatefulWidget {
  @override
  _AddTijerasState createState() => _AddTijerasState();
}

class _AddTijerasState extends State<AddTijeras> {
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
  var _value3 = ['Adolfo', 'Carlos'];
  var _value3Selected = 'Adolfo';
  //Radiobutton
  int _currentTimeValue = 1;

  final _buttonOptions = [
    TimeValue(1, "Reafilado"),
    TimeValue(2, "Corte"),
    TimeValue(3, "Corte y reafilado"),
  ];

  String id;
  Timestamp fechaTrabajo;
  String turno;
  String producto;
  String lote;
  String hojas;
  String trabajo;
  String rechazoLitografia;
  String responsable;

  @override
  Widget build(BuildContext context) {
    DateTime fechaActual = DateTime.now();
    Timestamp fechaActualFirebase = Timestamp.now();
    fechaTrabajo = fechaActualFirebase;
    var productProvider = Provider.of<CRUDModelTijeras>(context);
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
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Lote"),
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
                                    onSaved: (value) => lote = value),
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
                                Text("Hojas"),
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
                                    onSaved: (value) => hojas = value),
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
                              Text("Trabajo"),
                              Container(
                                height: 160,
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(8.0),
                                  children: _buttonOptions
                                      .map((timeValue) => RadioListTile(
                                            groupValue: _currentTimeValue,
                                            title: Text(timeValue._value),
                                            value: timeValue._key,
                                            onChanged: (val) {
                                              setState(() {
                                                _currentTimeValue = val;
                                                trabajo = timeValue._value;
                                              });
                                            },
                                          ))
                                      .toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
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
                                Text("Rechazo de litografia"),
                                TextFormField(
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
                                    onSaved: (value) =>
                                        rechazoLitografia = value),
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
                                Text("Responsable"),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  items:
                                      _value3.map((String dropDownStringItem) {
                                    responsable = _value3Selected;
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue3) {
                                    _onChangedValue3(newValue3);
                                    responsable = newValue3;
                                  },
                                  value: _value3Selected,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  RaisedButton(
                    splashColor: Colors.red,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (trabajo == null) {
                          trabajo = "Reafilado";
                        }
                        _formKey.currentState.save();
                        await productProvider.addProduct(Tijeras(
                            fechaTrabajo: fechaTrabajo,
                            turno: turno,
                            producto: producto,
                            lote: int.parse(lote),
                            hojas: int.parse(hojas),
                            trabajo: trabajo,
                            rechazoLitografia: rechazoLitografia,
                            responsable: responsable));
                        Navigator.pushNamed(context, '/readTijeras');
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
}

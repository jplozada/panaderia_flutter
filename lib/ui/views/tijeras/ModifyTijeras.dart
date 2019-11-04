import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/tijerasModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelTijeras.dart';
import 'package:provider/provider.dart';

class TimeValue {
    final int _key;
    final String _value;
    TimeValue(this._key, this._value);
}

class ModifyTijeras extends StatefulWidget {
  final Tijeras product;

  ModifyTijeras({@required this.product});

  @override
  _ModifyTijerasState createState() => _ModifyTijerasState();
}

class _ModifyTijerasState extends State<ModifyTijeras> {
  final _formKey = GlobalKey<FormState>();
  //Dropdownbutton value1
  var _value1 = ['1er turno', '2do turno'];
	var _value1Selected = '1er turno';
  //Dropdownbutton value2
  var _value2 = ['CBN', 'HUARI', 'TAQUIÑA PILSENER', 'TAQUIÑA EXPORT', 'DUCAL'];
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
    final productProvider = Provider.of<CRUDModelTijeras>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar registro'),
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
                          Text("${widget.product.fechaTrabajo.toDate().day}-${widget.product.fechaTrabajo.toDate().month}-${widget.product.fechaTrabajo.toDate().year}",),
                          ],
                        ),
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text("Hora trabajo"),
                          Text("${widget.product.fechaTrabajo.toDate().hour}:${widget.product.fechaTrabajo.toDate().minute}:${widget.product.fechaTrabajo.toDate().second}",),
                          ],
                        ),
                      )
                    ),
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Turno"),
                                Text("Guardado: ${widget.product.turno}", style: TextStyle(color: Colors.redAccent),),
                              ],
                          ),
                          DropdownButton<String>(
                            items: _value1.map((String dropDownStringItem) {
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
                      )
                    ),
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Producto"),
                                Text("Guardado: ${widget.product.producto}", style: TextStyle(color: Colors.redAccent),),
                              ],
                            ),
                          DropdownButton<String>(
                            isExpanded: true,
                            items: _value2.map((String dropDownStringItem) {
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
                      )
                    ),
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
                              initialValue: widget.product.lote.toString(),
                              keyboardType: TextInputType.numberWithOptions(),
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
                                onSaved: (value) => lote = value
                            ),
                          ],
                        ),
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Hojas"),
                            TextFormField(
                              initialValue: widget.product.hojas.toString(),
                              keyboardType: TextInputType.numberWithOptions(),
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
                                onSaved: (value) => hojas = value
                            ),
                          ],
                        ),
                      )
                    ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Turno"),
                                Text("Guardado: ${widget.product.trabajo}", style: TextStyle(color: Colors.redAccent),),
                              ],
                          ),
                            Container(
                              height: 160,
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(8.0),
                                children: _buttonOptions.map((timeValue) => RadioListTile(
                                    groupValue: _currentTimeValue,
                                    title: Text(timeValue._value),
                                    value: timeValue._key,
                                    onChanged: (val) {
                                        setState(() {
                                            _currentTimeValue = val;
                                            trabajo = timeValue._value;
                                        });
                                    },
                                )).toList(),
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
                              initialValue: widget.product.rechazoLitografia,
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
                                onSaved: (value) => rechazoLitografia = value
                            ),
                          ],
                        ),
                      )
                    ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Responsable"),
                                Text("Guardado: ${widget.product.responsable}", style: TextStyle(color: Colors.redAccent),),
                              ],
                            ),
                            DropdownButton<String>(
                              isExpanded: true,
                              items: _value3.map((String dropDownStringItem) {
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
                      )
                    ),
                  ],
                ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    if (trabajo == null) {
                      trabajo = widget.product.trabajo;
                    }
                    if (turno == null) {
                      turno = widget.product.turno;
                    }
                    if (producto == null) {
                      producto = widget.product.producto;
                    } 
                    if (responsable == null) {
                      responsable = widget.product.responsable;
                    } 
                    _formKey.currentState.save();
                    await productProvider.updateProduct(Tijeras(fechaTrabajo: fechaTrabajo, turno: turno, producto: producto, lote: int.parse(lote), hojas: int.parse(hojas), trabajo: trabajo, rechazoLitografia: rechazoLitografia, responsable: responsable),widget.product.id);
                    Navigator.pushNamed(context, '/readTijeras');
                  }
                },
                child: Text('Modificar registro', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
      )
    );
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

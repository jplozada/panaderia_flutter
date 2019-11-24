import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panaderia_flutter/core/models/litografiaModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelLitografia.dart';
import 'package:provider/provider.dart';

class ModifyLitografia extends StatefulWidget {
  final Litografia product;

  ModifyLitografia({@required this.product});

  @override
  _ModifyLitografiaState createState() => _ModifyLitografiaState();
}

class _ModifyLitografiaState extends State<ModifyLitografia> {
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

  Timestamp fechaTrabajo;
  String horaTrabajo;
  String turno;
  String producto;
  String cliente;
  String trabajo;
  String hojasProducidas;
  String hojasAProducir;
  String materiaPrima;
  String observacion;
  DateTime dateDateTime;
  TimeOfDay selectedTime;

  @override
  void initState() {
    _value2Selected = widget.product.producto;
    _value1Selected = widget.product.turno;
    DateTime dateDateTime = widget.product.fechaTrabajo.toDate();
    selectedTime = TimeOfDay(hour: int.parse("${widget.product.fechaTrabajo.toDate().hour}"), minute: int.parse("${widget.product.fechaTrabajo.toDate().minute}"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  //HourPicker
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });
    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
        dateDateTime = new DateTime(widget.product.fechaTrabajo.toDate().year, widget.product.fechaTrabajo.toDate().month,
            widget.product.fechaTrabajo.toDate().day, selectedTime.hour, selectedTime.minute);
            print(dateDateTime);
        Timestamp dateTimestamp = Timestamp.fromDate(dateDateTime);
        fechaTrabajo = dateTimestamp;
      });
  }

    // Timestamp fechaActualFirebase = widget.product.fechaTrabajo;
    // fechaTrabajo = fechaActualFirebase;
    // Timestamp to datetime
    // DateTime dateDateTime = fechaTrabajo.toDate();
    // print(dateDateTime);
    //Datetime to timestamp
    // Timestamp dateTimestamp = Timestamp.fromDate(dateDateTime);
    // print(dateTimestamp);

    final productProvider = Provider.of<CRUDModelLitografia>(context);
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
                                Text(
                                  "Fecha trabajo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "${widget.product.fechaTrabajo.toDate().day}-${widget.product.fechaTrabajo.toDate().month}-${widget.product.fechaTrabajo.toDate().year}",
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
                                Text(
                                  "Hora trabajo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text("${selectedTime.format(context)}"),
                                RaisedButton(
                                  onPressed: () => _selectTime(context),
                                  child: Text('Select date'),
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
                                Text(
                                  "Turno",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                DropdownButton<String>(
                                  items:
                                      _value1.map((String dropDownStringItem) {
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
                                Text(
                                  "Producto",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  items:
                                      _value2.map((String dropDownStringItem) {
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
                                Text(
                                  "Cliente",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                TextFormField(
                                    initialValue: widget.product.cliente,
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
                                    onSaved: (value) => cliente = value),
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
                                Text(
                                  "Trabajo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                TextFormField(
                                    initialValue: widget.product.trabajo,
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
                                    onSaved: (value) => trabajo = value),
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
                                Text(
                                  "Hojas producidas",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                TextFormField(
                                    initialValue: widget.product.hojasProducidas
                                        .toString(),
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
                                    onSaved: (value) =>
                                        hojasProducidas = value),
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
                                Text(
                                  "Hojas a producir",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                TextFormField(
                                    initialValue: widget.product.hojasAProducir
                                        .toString(),
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
                                    onSaved: (value) => hojasAProducir = value),
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
                                Text(
                                  "Materia prima",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                TextFormField(
                                    initialValue: widget.product.materiaPrima,
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
                                    onSaved: (value) => materiaPrima = value),
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
                                Text(
                                  "Observacion",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                TextFormField(
                                    initialValue: widget.product.observacion,
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
                                    onSaved: (value) => observacion = value),
                              ],
                            ),
                          )),
                    ],
                  ),
                  RaisedButton(
                    splashColor: Colors.red,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (turno == null) {
                          turno = widget.product.turno;
                        }
                        if (producto == null) {
                          producto = widget.product.producto;
                        }
                        _formKey.currentState.save();
                        await productProvider.updateProduct(
                            Litografia(
                                fechaTrabajo: fechaTrabajo,
                                horaTrabajo: horaTrabajo,
                                turno: turno,
                                producto: producto,
                                cliente: cliente,
                                trabajo: trabajo,
                                hojasProducidas: int.parse(hojasProducidas),
                                hojasAProducir: int.parse(hojasAProducir),
                                materiaPrima: materiaPrima,
                                observacion: observacion),
                            widget.product.id);
                        Navigator.pushNamed(context, '/readLitografia');
                      }
                    },
                    child: Text('Modificar registro',
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
}

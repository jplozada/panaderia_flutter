import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panaderia_flutter/core/models/finalProductModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelFinalProduct.dart';
import 'package:provider/provider.dart';

class ModifyFinalProduct extends StatefulWidget {
  final FinalProduct product;

  ModifyFinalProduct({@required this.product});

  @override
  _ModifyFinalProductState createState() => _ModifyFinalProductState();
}

class _ModifyFinalProductState extends State<ModifyFinalProduct> {
  final _formKey = GlobalKey<FormState>();

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
    "PVC plastisol",
    "PVC fondo oscuro",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentPVC;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
//    if(widget.product.tipoPVC=='PVC plastisol'){
//      _currentPVC = _dropDownMenuItems[0].value;
//    }
//    if(widget.product.tipoPVC=='PVC fondo oscuro'){
//      _currentPVC = _dropDownMenuItems[1].value;
//    }
//    _currentPVC = _dropDownMenuItems[0].value;
    _currentPVC = widget.product.tipoPVC;

    _dropDownMenuItemsEstado = getDropDownMenuItemsEstado(); //para es estado
//    if(widget.product.estado=='En Almacen'){
//      _currentEstado = _dropDownMenuItems[0].value;
//    }
//    if(widget.product.estado=='Entregado'){
//      _currentEstado = _dropDownMenuItems[1].value;
//    }
//    _currentEstado = _dropDownMenuItemsEstado[0].value; //para el estado
    _currentEstado = widget.product.estado;
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
    final productProvider = Provider.of<CRUDModelFinalProduct>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Modificar registro'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    enabled: false,
//controller: TextEditingController(),
//                    controller: email_controller,
                    autofocus: false,
                    initialValue: widget.product.nombre,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Producto',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese el nombre del producto';
                      }
                    },
                    onSaved: (value) => nombre = value,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Cliente",
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
                    initialValue: widget.product.cliente,
//                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Cliente',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Introduzca el Nombre del cliente';
                      }
                    },
                    onSaved: (value) => cliente = value,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Cantidad de Cajas",
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
                    initialValue: widget.product.cantidad.toString(),
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Cantidad',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Introduzca el Numero de Cantidad de Cajas';
                      }
                    },
                    onSaved: (value) => cantidad = value,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Fecha",
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
                    enabled: false,
//controller: TextEditingController(),
//                    controller: email_controller,
                    autofocus: false,
                    initialValue: widget.product.fecha,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Fecha',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'Ingrese la Fecha';
//                      }
//                    },
//                    onSaved: (value) => fecha = value,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Hora",
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
                    enabled: false,
//controller: TextEditingController(),
//                    controller: email_controller,
                    autofocus: false,
                    initialValue: widget.product.hora,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Hora',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'Introduzca el Numero de Cantidad de Cajas';
//                      }
//                    },
//                    onSaved: (value) => hora = value,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Estado",
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
                    height: 1,
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
                    height: 1,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Tipo PVC",
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
                    height: 1,
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
                    height: 16,
                  ),
                  RaisedButton(
                    splashColor: Colors.red,
                    onPressed: () async {
                      tipoPVC = _currentPVC;
                      estado = _currentEstado;
                      fecha = new DateFormat.yMd().format(new DateTime.now()) + ' ' + new DateFormat.Hms().format(new DateTime.now());
                      hora = new DateFormat.Hms().format(new DateTime.now());
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        await productProvider.updateProduct(
                            FinalProduct(
                              tipoPVC: tipoPVC,
                              nombre: nombre,
                              hora: hora,
                              fecha: fecha,
                              estado: estado,
                              cliente: cliente,
                              cantidad: int.parse(cantidad),
                            ),
                            widget.product.id);
                        Navigator.pushNamed(context, '/readFinalProduct');
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
}

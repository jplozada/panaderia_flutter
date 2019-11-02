import 'package:flutter/material.dart';
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

  String fechaTrabajo;
  String horaTrabajo;
  String turno;
  String producto;
  String cliente;
  String trabajo;
  String hojasProducidas;
  String hojasAProducir;
  String materiaPrima;
  String observacion;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelLitografia>(context);
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
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Nombre del producto"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.turno,
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
                  onSaved: (value) => turno = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Precio"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.producto,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Precio',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca el precio';
                    }
                  },
                  onSaved: (value) => producto = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Cantida de salida"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.cliente,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cantidad de Salida',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese la cantidad de salida';
                    }
                  },
                  onSaved: (value) => cliente = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Cantidad de entrada"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.hojasProducidas.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cantidad de entrada',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese la cantidad de entrada';
                    }
                  },
                  onSaved: (value) => hojasProducidas = value
              ),              
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.updateProduct(Litografia(fechaTrabajo: fechaTrabajo, horaTrabajo: horaTrabajo, turno: turno, producto: producto, cliente: cliente, trabajo: trabajo, hojasProducidas: int.parse(hojasProducidas), hojasAProducir: int.parse(hojasAProducir), materiaPrima: materiaPrima, observacion: observacion),widget.product.id);
                    Navigator.pushNamed(context, '/readLitografia');
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
}

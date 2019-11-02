import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/inventoryModel.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodels/CRUDModelInventory.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddInventory extends StatefulWidget {
  @override
  _AddInventoryState createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  final _formKey = GlobalKey<FormState>();
  String _counter,_value = "Presione el boton para escanear";
  Future _incrementCounter() async{
    _counter= await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true, ScanMode.DEFAULT);
    setState(() {
      _value=_counter;
      nombre = _value;
    });
  }

  String nombre ;
  String cantTotal ;
  String cantSalida ;
  String cantEntrada ;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDModelInventory>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                      child: Text("Leer QR", style: TextStyle(color: Colors.white),),
                      color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cantidad total',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Introduzca la cantidad total';
                  }
                },
                  onSaved: (value) => cantTotal = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cantidad Salida',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Introduzca la cantidad de salida';
                  }
                },
                  onSaved: (value) => cantSalida = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cantidad Entrada',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Introduzca la cantidad de entrada';
                  }
                },
                  onSaved: (value) => cantEntrada = value
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.addProduct(Inventory(nombre: nombre, cantTotal: int.parse(cantTotal), cantSalida: int.parse(cantSalida), cantEntrada: int.parse(cantEntrada)));
                    Navigator.pushNamed(context, '/readInventory');
                  }
                },
                child: Text('Añadir registro', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}

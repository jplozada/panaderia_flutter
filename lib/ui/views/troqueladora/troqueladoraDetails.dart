import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/troqueladoraModel.dart';

class TroqueladoraDetail extends StatefulWidget {
  final Troqueladora product;

  TroqueladoraDetail({@required this.product});

  @override
  _TroqueladoraDetailState createState() => _TroqueladoraDetailState();
}

class _TroqueladoraDetailState extends State<TroqueladoraDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Column(
          children: <Widget>[

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

            TextFormField(
              enabled: false,
              autofocus: false,
              initialValue: widget.product.nombreProducto,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cantidad Desperdicio',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Container(
              child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Maquinaria",
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

            TextFormField(
              enabled: false,
              autofocus: false,
              initialValue: widget.product.maquinaria,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cantidad Desperdicio',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),


            SizedBox(
              height: 16,
            ),

            Container(
              child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Turno",
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

            TextFormField(
              enabled: false,
              autofocus: false,
              initialValue: widget.product.turno,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cantidad Desperdicio',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Container(
              child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Produccion Hojas Traqueladas",
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

            TextFormField(
              enabled: false,
              autofocus: false,
              initialValue: widget.product.produccion.toString(),
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cantidad Desperdicio',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Container(
              child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tapas Malas Desperdicio",
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

            TextFormField(
              enabled: false,
              autofocus: false,
              initialValue: widget.product.tapasMalas.toString(),
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cantidad Desperdicio',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Container(
              child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Responsable",
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

            TextFormField(
              enabled: false,
              autofocus: false,
              initialValue: widget.product.responsable,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cantidad Desperdicio',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

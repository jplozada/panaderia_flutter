import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/tijerasModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelTijeras.dart';
import 'package:panaderia_flutter/ui/views/tijeras/ModifyTijeras.dart';
import 'package:provider/provider.dart';

class TijerasDetails extends StatelessWidget {
  final Tijeras product;

  TijerasDetails({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelTijeras>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del registro'),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: ()async {
              await productProvider.removeProduct(product.id);
              Navigator.pushNamed(context, '/readTijeras');
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyTijeras(product: product,)));
            },
          )
        ],
      ),
      body: Column(
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
                          Text("${product.fechaTrabajo.toDate().day}-${product.fechaTrabajo.toDate().month}-${product.fechaTrabajo.toDate().year}",)
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
                          Text("${product.fechaTrabajo.toDate().hour}:${product.fechaTrabajo.toDate().minute}:${product.fechaTrabajo.toDate().second}",)
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
                          Text("Turno"),
                          Text(product.turno)
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
                          Text("Producto"),
                          Text(product.producto)
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
                            Text(product.lote.toString())
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
                            Text(product.hojas.toString())
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
                            Text("Trabajo"),
                            Text(product.trabajo)
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
                            Text("Rechazo de litografia"),
                            Text(product.rechazoLitografia)
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
                            Text("Responsable"),
                            Text(product.responsable)
                          ],
                        ),
                      )
                    ),
                  ],
                ),
            ],
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/litografiaModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelLitografia.dart';
import 'package:panaderia_flutter/ui/views/litografia/ModifyLitografia.dart';
import 'package:provider/provider.dart';

class LitografiaDetails extends StatelessWidget {
  final Litografia product;

  LitografiaDetails({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelLitografia>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del registro'),
        actions: <Widget>[
          
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: ()async {
              await productProvider.removeProduct(product.id);
              Navigator.pushNamed(context, '/readLitografia');
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyLitografia(product: product,)));
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
                          Text(product.fechaTrabajo)
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
                          Text(product.horaTrabajo)
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
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text("Cliente"),
                          Text(product.cliente)
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
                            Text("Hojas producidas"),
                            Text(product.hojasProducidas.toString())
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
                            Text("Hojas a producir"),
                            Text(product.hojasAProducir.toString())
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
                            Text("Materia prima"),
                            Text(product.materiaPrima)
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
                            Text("Observacion"),
                            Text(product.observacion)
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

import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/litografiaModel.dart';
import 'package:panaderia_flutter/ui/views/litografia/ModifyLitografia.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelLitografia.dart';
import 'package:provider/provider.dart';

class LitografiaCard extends StatelessWidget {
  final Litografia product;

  LitografiaCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelLitografia>(context);

    return Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 5,
          child: Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height * 0.18,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.fechaTrabajo,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.trabajo,
                                    style: TextStyle(
                                      fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.producto,
                                    style: TextStyle(
                                      fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                          iconSize: 35,
                          icon: Icon(Icons.delete_forever),
                          onPressed: () {
                            productProvider.removeProduct(product.id);
                            Navigator.pushNamed(context, '/readLitografia');
                          },
                        ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                          iconSize: 35,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyLitografia(product: product,)));
                            },
                        ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      );
  }
}

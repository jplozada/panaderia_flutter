import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/litografiaModel.dart';
import 'package:panaderia_flutter/ui/views/litografia/ModifyLitografia.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelLitografia.dart';
import 'package:panaderia_flutter/ui/views/litografia/litografiaDetails.dart';
import 'package:provider/provider.dart';

class LitografiaCard extends StatelessWidget {
  final Litografia product;

  LitografiaCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelLitografia>(context);

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => LitografiaDetails(product: product)));
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
        color: Color.fromARGB(0xFF, 0xBB, 0xDE, 0xFB),
        elevation: 8,
        child: Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height * 0.18,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Fecha',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  product.fechaTrabajo,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Trabajo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  product.trabajo,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Producto',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    product.producto,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        iconSize: 35,
                                        icon: Icon(Icons.delete_forever),
                                        onPressed: () {
                                          productProvider
                                              .removeProduct(product.id);
                                          Navigator.pushNamed(
                                            context,
                                            '/readLitografia',
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        iconSize: 35,
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ModifyLitografia(
                                                product: product,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        )
                  ],
                )
              ],
            ),
          ),
      ),
      ),
    );
  }
}

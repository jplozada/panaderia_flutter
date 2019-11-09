import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panaderia_flutter/core/models/troqueladoraModel.dart';
//import 'package:panaderia_flutter/ui/views/inventory/ModifyInventory.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelTroqueladora.dart';
import 'package:panaderia_flutter/ui/views/troqueladora/modifyTroqueladora.dart';
import 'package:panaderia_flutter/ui/views/troqueladora/troqueladoraDetails.dart';
import 'package:provider/provider.dart';

class TroqueladoraCard extends StatelessWidget {
  final Troqueladora product;

  TroqueladoraCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelTroqueladora>(context);

    print(product.nombreProducto);

    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        color: Color.fromARGB(
          0xFF,
          0xBB,
          0xDE,
          0xFB,
        ),
        elevation: 8,
        child: InkWell(
          onTap: () {
            print("presionado");
            print(new DateFormat.y().format(new DateTime.now()));
            print(new DateFormat.M().format(new DateTime.now()));
            print(new DateFormat.d().format(new DateTime.now()));
            print(new DateFormat.H().format(new DateTime.now()));
            print(new DateFormat.m().format(new DateTime.now()));
            print(new DateFormat.s().format(new DateTime.now()));

            String variable1 = new DateFormat.yMd().format(new DateTime.now());
            print(variable1);
            String variable = new DateFormat.Hms().format(new DateTime.now());
            print(variable);

            print(new DateTime.now());
            print(new DateFormat.yMMMd().format(new DateTime.now()));

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    TroqueladoraDetail(
                      product: product,
                    ),
              ),
            );
//            var format = DateFormat.yMd('ar');
//            var dateString = format.format(DateTime.now());
//
//            print(format);
//            print(dateString);
//            final f = new DateFormat('yyyy-MM-dd hh:mm');
//
//            Text(f.format(new DateTime.fromMillisecondsSinceEpoch(values[index]["start_time"]*1000)));
//            print(new DateFormat.yMMMd().format(new DateTime.now()));
//            final f = new DateFormat('yyyy-MM-dd hh:mm');
//
//            Text(f.format(new DateTime.fromMillisecondsSinceEpoch(values[index]["start_time"]*1000)));

//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (_) =>
//                    TroqueladoraDetail(
//                      product: product,
//                    ),
//              ),
//            );
          },
          child: Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height * 0.18,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Container(
                    height: 140.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Nombre Producto',
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
                                  product.nombreProducto,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Divider(),
                              Container(
                                child: Text(
                                  'Produccion',
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
                                  product.produccion.toString(),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Fecha',
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
                                  product.fechaTrabajo,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Divider(),
                              Container(
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
                                            '/readTroqueladora',
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
                                              builder: (_) =>
                                                  ModifyTroqueladora(
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
                            ],
                          ),
                        ),
//                      Expanded(
//                        flex: 1,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Container(
//                              child: Text(
//                                product.fecha,
//                                style: TextStyle(
//                                  fontSize: 16,
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      Expanded(
//                        flex: 1,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Container(
//                              child: Text(
//                                product.estado,
//                                style: TextStyle(
//                                  fontSize: 16,
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      Expanded(
//                        flex: 1,
//                        child: IconButton(
//                          iconSize: 35,
//                          icon: Icon(Icons.delete_forever),
//                          onPressed: () {
//                            productProvider.removeProduct(product.id);
//                            Navigator.pushNamed(
//                              context,
//                              '/readInventory',
//                            );
//                          },
//                        ),
//                      ),
//                      Expanded(
//                        flex: 1,
//                        child: IconButton(
//                          iconSize: 35,
//                          icon: Icon(Icons.edit),
//                          onPressed: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (_) => ModifyInventory(
//                                  product: product,
//                                ),
//                              ),
//                            );
//                          },
//                        ),
//                      ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

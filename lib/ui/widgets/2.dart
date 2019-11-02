import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/inventoryModel.dart';
import 'package:panaderia_flutter/ui/views/inventory/ModifyInventory.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelInventory.dart';
import 'package:provider/provider.dart';

class InventoryCard extends StatelessWidget {
  final Inventory product;

  InventoryCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelInventory>(context);

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
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.nombre,
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
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.cantTotal.toString(),
                                    style: TextStyle(
                                      fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.cantSalida.toString(),
                                    style: TextStyle(
                                      fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.cantEntrada.toString(),
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
                            Navigator.pushNamed(context, '/readInventory');
                          },
                        ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                          iconSize: 35,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyInventory(product: product,)));
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

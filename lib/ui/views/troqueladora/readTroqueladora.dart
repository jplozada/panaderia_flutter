import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/troqueladoraModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelTroqueladora.dart';
//import 'package:panaderia_flutter/ui/widgets/inventoryCard.dart';
import 'package:panaderia_flutter/ui/widgets/troqueladoraCard.dart';
import 'package:provider/provider.dart';

class ReadTroqueladora extends StatefulWidget {
  @override
  _ReadTroqueladoraState createState() => _ReadTroqueladoraState();
}

class _ReadTroqueladoraState extends State<ReadTroqueladora> {
  List<Troqueladora> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelTroqueladora>(context);

//    print(products.nombreProducto);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTroqueladora');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Troqueladora'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Troqueladora.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      TroqueladoraCard(product: products[index]),
                );
              } else {
                return Center(child: Text('Cargando datos...'),);
              }
            }),
      ),
    );
  }
}

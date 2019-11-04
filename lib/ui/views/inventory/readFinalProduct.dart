import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/finalProductModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelFinalProduct.dart';
import 'package:panaderia_flutter/ui/widgets/finalProductCard.dart';
import 'package:provider/provider.dart';

class ReadFinalProduct extends StatefulWidget {
  @override
  _ReadFinalProductState createState() => _ReadFinalProductState();
}

class _ReadFinalProductState extends State<ReadFinalProduct> {
  List<FinalProduct> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelFinalProduct>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addFinalProduct');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Producto Final'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => FinalProduct.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      FinalProductCard(product: products[index]),
                );
              } else {
                return Center(child: Text('Cargando datos...'),);
              }
            }),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/tijerasModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelTijeras.dart';
import 'package:panaderia_flutter/ui/widgets/tijerasCard.dart';
import 'package:provider/provider.dart';

class ReadTijeras extends StatefulWidget {
  @override
  _ReadTijerasState createState() => _ReadTijerasState();
}

class _ReadTijerasState extends State<ReadTijeras> {
  List<Tijeras> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelTijeras>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTijeras');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Tijeras'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Tijeras.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      TijerasCard(product: products[index]),
                );
              } else {
                return Center(child: Text('Cargando datos...'),);
              }
            }),
      ),
    );
  }
}

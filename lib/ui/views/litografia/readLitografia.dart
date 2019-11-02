import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/litografiaModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelLitografia.dart';
import 'package:panaderia_flutter/ui/widgets/litografiaCard.dart';
import 'package:provider/provider.dart';

class ReadLitografia extends StatefulWidget {
  @override
  _ReadLitografiaState createState() => _ReadLitografiaState();
}

class _ReadLitografiaState extends State<ReadLitografia> {
  List<Litografia> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelLitografia>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addLitografia');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Litografia.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      LitografiaCard(product: products[index]),
                );
              } else {
                return Center(child: Text('Cargando datos...'),);
              }
            }),
      ),
    );
  }
}

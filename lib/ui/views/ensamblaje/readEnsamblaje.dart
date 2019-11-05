import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/ensamblajeModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelEnsamblaje.dart';
import 'package:panaderia_flutter/ui/widgets/ensamblajeCard.dart';
import 'package:provider/provider.dart';

class ReadEnsamblaje extends StatefulWidget {
  @override
  _ReadEnsamblajeState createState() => _ReadEnsamblajeState();
}

class _ReadEnsamblajeState extends State<ReadEnsamblaje> {
  List<Ensamblaje> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelEnsamblaje>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addEnsamblaje');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Ensamblaje'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Ensamblaje.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      EnsamblajeCard(product: products[index]),
                );
              } else {
                return Center(child: Text('Cargando datos...'),);
              }
            }),
      ),
    );
  }
}

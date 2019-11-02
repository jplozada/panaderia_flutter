import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/inventoryModel.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelInventory.dart';
import 'package:panaderia_flutter/ui/widgets/inventoryCard.dart';
import 'package:provider/provider.dart';

class ReadInventory extends StatefulWidget {
  @override
  _ReadInventoryState createState() => _ReadInventoryState();
}

class _ReadInventoryState extends State<ReadInventory> {
  List<Inventory> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelInventory>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addInventory');
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
                    .map((doc) => Inventory.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      InventoryCard(product: products[index]),
                );
              } else {
                return Center(child: Text('Cargando datos...'),);
              }
            }),
      ),
    );
  }
}

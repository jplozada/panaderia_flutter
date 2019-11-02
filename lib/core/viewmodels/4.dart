import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/inventoryModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelInventory extends ChangeNotifier {
  ApiInventory _api = locator<ApiInventory>();

  List<Inventory> products;


  Future<List<Inventory>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Inventory.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Inventory> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Inventory.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Inventory data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Inventory data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}

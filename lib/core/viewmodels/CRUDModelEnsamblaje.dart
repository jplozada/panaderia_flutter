import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/ensamblajeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelEnsamblaje extends ChangeNotifier {
  ApiEnsamblaje _api = locator<ApiEnsamblaje>();

  List<Ensamblaje> products;


  Future<List<Ensamblaje>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Ensamblaje.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Ensamblaje> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Ensamblaje.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Ensamblaje data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Ensamblaje data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}

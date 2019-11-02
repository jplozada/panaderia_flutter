import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/litografiaModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelLitografia extends ChangeNotifier {
  ApiLitografia _api = locator<ApiLitografia>();

  List<Litografia> products;


  Future<List<Litografia>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Litografia.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Litografia> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Litografia.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Litografia data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Litografia data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}

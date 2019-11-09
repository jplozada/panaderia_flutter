import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/troqueladoraModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelTroqueladora extends ChangeNotifier {
  ApiTroqueladora _api = locator<ApiTroqueladora>();

  List<Troqueladora> products;


  Future<List<Troqueladora>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Troqueladora.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Troqueladora> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Troqueladora.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Troqueladora data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Troqueladora data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}

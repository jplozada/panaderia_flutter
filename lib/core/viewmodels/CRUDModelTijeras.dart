import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/tijerasModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelTijeras extends ChangeNotifier {
  ApiTijeras _api = locator<ApiTijeras>();

  List<Tijeras> products;


  Future<List<Tijeras>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Tijeras.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Tijeras> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Tijeras.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Tijeras data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Tijeras data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}

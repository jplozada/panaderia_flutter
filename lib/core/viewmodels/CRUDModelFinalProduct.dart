import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/finalProductModel.dart';
//import '../models/finalProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelFinalProduct extends ChangeNotifier {
  ApiFinalProduct _api = locator<ApiFinalProduct>();
//  ApiInventory _api = locator<ApiInventory>();

  List<FinalProduct> products;
//  List<Inventory> products;
//
Future<List<FinalProduct>> fetchProducts() async {
//  Future<List<Inventory>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => FinalProduct.fromMap(doc.data, doc.documentID))
//        .map((doc) => Inventory.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<FinalProduct> getProductById(String id) async {
//  Future<Inventory> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  FinalProduct.fromMap(doc.data, doc.documentID) ;
//    return  Inventory.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }

  Future updateProduct(FinalProduct data,String id) async{
//  Future updateProduct(Inventory data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(FinalProduct data) async{
//  Future addProduct(Inventory data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}

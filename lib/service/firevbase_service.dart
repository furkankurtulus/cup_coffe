import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cup_coffe/model/order.dart';
import 'package:cup_coffe/model/product.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  List<DocumentSnapshot> templist = [];
  List<Map<String, dynamic>> list = [];
  ObserverList<Product> model = ObserverList<Product>();
  CollectionReference collectionRef = FirebaseFirestore.instance.collection("products");
  final firebaseDoc = FirebaseFirestore.instance.collection("order").doc();

  Future<bool> createOrder(Order model) async {
    bool success = false;
    try {
      await firebaseDoc.set(model.toJson());
    } catch (exception) {
      success = false;
      return success;
    }
    success = true;
    return success;
  }

  Future<ObserverList<Product>> getProducts() async {
    QuerySnapshot collectionSnapshot = await collectionRef.get();
    templist = collectionSnapshot.docs;
    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data() as Map<String, dynamic>;
    }).toList();
    for (Map<String, dynamic> i in list.toList()) {
      model.add(Product.fromJson(i));
    }
    return model;
  }
}

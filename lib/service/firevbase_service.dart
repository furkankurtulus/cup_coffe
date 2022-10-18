import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cup_coffe/model/order.dart';

class FirebaseService {
  Future<bool> createOrder(Order model) async {
    bool success = false;
    try {
      final firebaseDoc = FirebaseFirestore.instance.collection("order").doc();
      await firebaseDoc.set(model.toJson());
    } catch (exception) {
      success = false;
      return success;
    }
    success = true;
    return success;
  }
}

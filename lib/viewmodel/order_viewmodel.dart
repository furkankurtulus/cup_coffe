// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'dart:convert';

import 'package:cup_coffe/model/product.dart';
import 'package:cup_coffe/service/firevbase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:mobx/mobx.dart';

import '../model/order.dart';
part 'order_viewmodel.g.dart';

class OrderViewModel = _OrderViewModelBase with _$OrderViewModel;

abstract class _OrderViewModelBase with Store {
  final FirebaseService _firebaseService;

  _OrderViewModelBase(this._firebaseService);
  bool isLoading = false;

  @observable
  List<Product> productList = [];

  @action
  Future<bool> createOrder(Order model) async {
    var result = await _firebaseService.createOrder(model);
    return result;
  }

  Future<List<Product>> getProducts() async {
    var result = await _firebaseService.getProducts();
    productList = result.toList();
    return productList;
  }
}

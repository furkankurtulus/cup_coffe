// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:cup_coffe/service/firevbase_service.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:mobx/mobx.dart';

import '../model/order.dart';
part 'order_viewmodel.g.dart';

class OrderViewModel = _OrderViewModelBase with _$OrderViewModel;

abstract class _OrderViewModelBase with Store {
  final FirebaseService _firebaseService;
  // late final EmployeeViewModel _employeeViewModel;

  _OrderViewModelBase(this._firebaseService);
  bool isLoading = false;

  // @observable
  // List<AnnouncementEmployeeModel> announcementEmployees = [];

  // @observable
  // AnnouncementEmployeeModel? announcementEmployee;

  // @observable
  // String? doc;

  @action
  Future<bool> createOrder(Order model) async {
    var result = await _firebaseService.createOrder(model);
    return result;
  }

  // Future<bool> sendOTP() async {
  //   randomNumber = Random().nextInt(999999 - 100000);
  //   var token = preferences.getString("smlToken");
  //   var smsAccountId = preferences.getString("SmsAccountId");
  //   var smsOriginator = preferences.getString("SmsOriginator");

  //   await _employeeViewModel.getDetailedById();

  //   List<SmsDetailsDto> smsDetails = [];

  //   smsDetails.add(new SmsDetailsDto(
  //       msisdn: _employeeViewModel.employee!.phone.toString(),
  //       message: "Tek Kullanımlık Şifreniz: " + randomNumber.toString(),
  //       name: _employeeViewModel.employee!.name.toString(),
  //       lastname: _employeeViewModel.employee!.surname.toString(),
  //       expireAt: DateTime.now().add(Duration(days: 1)).toIso8601String(),
  //       maxRedirect: 1));

  //   var smsSettingDto = new SmsSettingDto(
  //     access_token: token,
  //     accountId: int.parse(smsAccountId!),
  //     originator: smsOriginator,
  //     startAt: DateTime.now(),
  //     domain: "sml.l2r.me",
  //     items: smsDetails,
  //     expires_in: 60,
  //   );

  //   var smsResult = await _settingsViewModel.sendSms(smsSettingDto);
  //   if (smsResult == true) {
  //     smsOTP = randomNumber;

  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}

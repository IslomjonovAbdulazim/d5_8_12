import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class PaymentModel {
  // members
  late String cardNumber;
  late String cvv;
  late String exp;
  late String cardholderName;

  // constructor
  PaymentModel({
    required this.cardNumber,
    required this.cvv,
    required this.exp,
    required this.cardholderName,
  });

  // fromJson
  PaymentModel.fromJson(Map json) {
    cardNumber = json["cardNumber"];
    cvv = json["cvv"];
    exp = json["exp"];
    cardholderName = json["cardholderName"];
  }

  // toJson
  Map toJson() => {
    "cardNumber": cardNumber,
    "cvv": cvv,
    "exp": exp,
    "cardholderName": cardholderName,
  };
}

Future<List<PaymentModel>> getAllPayments() async {
  final db = await SharedPreferences.getInstance();
  final data = db.getString("payments") ?? "[]";
  final jsonList = List.from(jsonDecode(data));
  final result = jsonList.map((json) => PaymentModel.fromJson(json)).toList();
  return result;
}

Future<void> saveAllPayments(List<PaymentModel> payments) async {
  final jsonList = payments.map((model) => model.toJson()).toList();
  final data = jsonEncode(jsonList);
  final db = await SharedPreferences.getInstance();
  await db.setString("payments", data);
}

Future<void> deletePayment(PaymentModel payment) async {
  final all = await getAllPayments();
  all.removeWhere((model) => model.cardNumber == payment.cardNumber);
  await saveAllPayments(all);
}

Future<void> addPayment(PaymentModel payment) async {
  final all = await getAllPayments();
  all.add(payment);
  await saveAllPayments(all);
}









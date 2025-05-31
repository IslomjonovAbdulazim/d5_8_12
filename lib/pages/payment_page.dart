import 'package:flutter/material.dart';

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
  late int cardNumber;
  late int cvv;
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










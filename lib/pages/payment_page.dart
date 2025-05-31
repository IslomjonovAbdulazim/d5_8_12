import 'dart:convert';

import 'package:d5_8_12/pages/add_payment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<PaymentModel> payments = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    payments = await getAllPayments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D182A),
      appBar: AppBar(
        backgroundColor: Color(0xff1D182A),
        leading: CupertinoButton(
          onPressed: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: payments.length,
                  itemBuilder: (context, index) {
                    final model = payments[index];
                    return ListTile(
                      title: Text(model.cardNumber),
                      subtitle: Text(model.cardholderName),
                      trailing: CupertinoButton(
                        onPressed: () {},
                        child: Icon(CupertinoIcons.delete),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              CupertinoButton(
                color: Color(0xff8E6CEF),
                onPressed: () async {
                  await Get.to(AddPaymentPage());
                  load();
                },
                child: Center(
                  child: Text(
                    "Add Card",
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

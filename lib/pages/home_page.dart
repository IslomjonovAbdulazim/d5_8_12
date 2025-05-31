import 'package:d5_8_12/pages/address_page.dart';
import 'package:d5_8_12/pages/payment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D182A),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  color: Color(0xff342F3F),
                  onPressed: () {
                    Get.to(AddressPage());
                  },
                  child: Row(
                    children: [
                      Text(
                        "Address",
                        style: GoogleFonts.quicksand(
                          color: Color(0xffFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: Color(0xffFFFFFF),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                CupertinoButton(
                  color: Color(0xff342F3F),
                  onPressed: () {
                    Get.to(PaymentPage());
                  },
                  child: Row(
                    children: [
                      Text(
                        "Payments",
                        style: GoogleFonts.quicksand(
                          color: Color(0xffFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: Color(0xffFFFFFF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({super.key});

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  final cardController = TextEditingController();
  final cardFocus = FocusNode();
  final cardMask = MaskTextInputFormatter(
    mask: "#### #### #### ####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  final cvvController = TextEditingController();
  final cvvFocus = FocusNode();
  final cvvMask = MaskTextInputFormatter(
    mask: "###",
    filter: {"#": RegExp(r'[0-9]')},
  );

  final expController = TextEditingController();
  final expFocus = FocusNode();
  final expMask = MaskTextInputFormatter(
    mask: "##/##",
    filter: {"#": RegExp(r'[0-9]')},
  );

  final nameController = TextEditingController();
  final nameFocus = FocusNode();

  final key = GlobalKey<FormState>();

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
          child: Form(
            key: key,
            child: Column(
              children: [
                // Card Number
                TextFormField(
                  controller: cardController,
                  focusNode: cardFocus,
                  onTapOutside: (value) => cardFocus.unfocus(),
                  inputFormatters: [cardMask],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (cardMask.isFill() == false) {
                      return "Karta kiritilsin";
                    }
                  },
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Color(0xff342F3F),
                      labelText: "Card Number",
                      labelStyle: GoogleFonts.quicksand(
                        color: Color(0xffFFFFFF).withOpacity(.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                ),

                // CVV & Exp
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cvvController,
                        focusNode: cvvFocus,
                        onTapOutside: (value) => cvvFocus.unfocus(),
                        inputFormatters: [cvvMask],
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (cvvMask.isFill() == false) {
                            return "CVV Kiritilsin";
                          }
                        },
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Color(0xff342F3F),
                          labelText: "CVV",
                          labelStyle: GoogleFonts.quicksand(
                            color: Color(0xffFFFFFF).withOpacity(.5),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: expController,
                        focusNode: expFocus,
                        onTapOutside: (value) => expFocus.unfocus(),
                        inputFormatters: [expMask],
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (expMask.isFill() == false) {
                            return "Exp kiritilsin";
                          }
                        },
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color(0xff342F3F),
                            labelText: "Exp",
                            labelStyle: GoogleFonts.quicksand(
                              color: Color(0xffFFFFFF).withOpacity(.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ],
                ),

                // Name
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  focusNode: nameFocus,
                  onTapOutside: (value) => nameFocus.unfocus(),
                  validator: (value) {
                    if (value!.length > 3) {
                      return "Ism Kiritilsin";
                    }
                  },
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Color(0xff342F3F),
                      labelText: "Cardholder Name",
                      labelStyle: GoogleFonts.quicksand(
                        color: Color(0xffFFFFFF).withOpacity(.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                ),

                Spacer(),
                CupertinoButton(
                  color: Color(0xff8E6CEF),
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      // Create...
                      Get.back();
                    }
                  },
                  child: Center(
                    child: Text(
                      "Save",
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
      ),
    );
  }
}

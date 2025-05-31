import 'package:flutter/material.dart';
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
      ),
    );
  }
}










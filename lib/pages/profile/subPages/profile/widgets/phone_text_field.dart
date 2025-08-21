import 'package:excellent_trade_app/config/components/custom_phone_field.dart';
import 'package:excellent_trade_app/config/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({super.key});

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  final phoneController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return CustomPhoneField(
      label: "Mobile Number",
      hintText: "Enter your mobile number",
      controller: phoneController,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
    );
  }
}

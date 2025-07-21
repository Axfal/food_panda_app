import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';

class CustomPinCodeField extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;

  const CustomPinCodeField({
    super.key,
    required this.controller,
    this.length = 6,
    this.onChanged,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: length,
      autoFocus: true,
      cursorColor: AppColors.black,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 50,
        fieldWidth: 45,
        activeFillColor: Colors.grey.shade100,
        inactiveFillColor: Colors.grey.shade100,
        selectedFillColor: Colors.grey.shade100,
        activeColor: AppColors.primary,
        selectedColor: AppColors.primary,
        inactiveColor: Colors.grey.shade300,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onChanged: onChanged ?? (value) {},
      onCompleted: onCompleted,
    );
  }
}

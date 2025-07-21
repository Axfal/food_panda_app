import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';

class CustomPhoneField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String initialCountryCode;
  final Function(String)? onChanged;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const CustomPhoneField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    this.initialCountryCode = 'PK',
    this.onChanged,
    required this.textInputAction,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      focusNode: focusNode,
      cursorColor: AppColors.black,
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? AppColors.primary : Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
      initialCountryCode: initialCountryCode,
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      onChanged: (phone) => onChanged?.call(phone.completeNumber),
    );
  }
}

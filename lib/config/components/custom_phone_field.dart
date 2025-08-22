import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';

class CustomPhoneField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool enable;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String initialCountryCode;
  final void Function(String countryCode, String number)? onChanged;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const CustomPhoneField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    this.enable = true,
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
      enabled: enable,
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
       disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
      initialCountryCode: initialCountryCode,
      keyboardType: TextInputType.phone,
      dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.black),
      textInputAction: textInputAction,
      dropdownTextStyle: TextStyle(color: Colors.grey.shade700),
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: Colors.white,
        searchFieldInputDecoration: InputDecoration(
          hintText: 'Search country',
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          prefixIcon: const Icon(Icons.search, color: Colors.black54),
          filled: true,
          enabled: enable,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),
        countryNameStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        countryCodeStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),

      onChanged: (phone) => onChanged?.call(phone.countryCode, phone.number),
    );
  }
}

import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixTap;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
    required this.textInputAction,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.black),
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(prefixIcon, color: Colors.grey),
        )
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
          onTap: onSuffixTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(suffixIcon, color: Colors.grey),
          ),
        )
            : null,
      ),
    );
  }
}

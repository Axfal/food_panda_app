import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;

  const CustomDropdownButton({
    super.key,
    required this.hintText,
    required this.items,
    required this.value,
    required this.onChanged,
    this.prefixIcon,
    this.validator,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.value,
      focusNode: _focusNode,
      validator: widget.validator,
      hint: Text(
        widget.hintText,
        style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(widget.prefixIcon, color: Colors.grey),
        )
            : null,
      ),
      dropdownColor: Colors.white,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
      items: widget.items
          .map(
            (item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(fontSize: 16, color: AppColors.black),
          ),
        ),
      )
          .toList(),
      onChanged: widget.onChanged,
    );
  }
}

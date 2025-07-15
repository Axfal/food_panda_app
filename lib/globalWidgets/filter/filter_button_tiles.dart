import 'package:flutter/material.dart';

class FilterButtonTile extends StatelessWidget {
  final String? title;
  final String? selectedText;
  final VoidCallback onTap;
  final IconData? icon;
  final bool showDropdownArrow;

  const FilterButtonTile({
    super.key,
    this.title,
    this.selectedText,
    required this.onTap,
    this.icon,
    this.showDropdownArrow = false, 
  });

  @override
  Widget build(BuildContext context) {
    final displayText = selectedText ?? title ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.black, width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null &&
                (title == null && selectedText == null)) // icon only
              Icon(icon, size: 18, color: Colors.black)
            else
              Text(
                displayText,
                style: const TextStyle(fontSize: 13, color: Colors.black),
              ),
            if (showDropdownArrow) ...[
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: Colors.black,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

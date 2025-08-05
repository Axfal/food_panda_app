import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        elevation: 1.5,
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(28),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 25, color: Colors.black87),
                  const SizedBox(width: 6),
                ],
                Text(
                  displayText,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                if (showDropdownArrow) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: Colors.black54,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

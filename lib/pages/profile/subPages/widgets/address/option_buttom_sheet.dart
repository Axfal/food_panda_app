import 'package:flutter/material.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';

class OptionBottomSheet extends StatelessWidget {
  final String selectedValue;
  final Function(String) onSelect;

  const OptionBottomSheet({
    super.key,
    required this.selectedValue,
    required this.onSelect,
  });

  final Map<String, String> options = const {
    "Home": "Stand-alone residential home",
    "Apartment": "Residential unit on specific floor",
    "Office": "Building used for professional work",
    "Hotel": "Lodging with guest services",
    "Other": "Park, mall, hospital, etc",
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What type of place is this?", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Help riders deliver your order with more accuracy", style: TextStyle(color: AppColors.textSecondary)),
          Expanded(
            child: ListView(
              children: options.entries.map((entry) {
                return RadioListTile<String>(
                  value: entry.key,
                  groupValue: selectedValue,
                  title: Text(entry.key),
                  subtitle: Text(entry.value),
                  onChanged: (value) => onSelect(value!),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

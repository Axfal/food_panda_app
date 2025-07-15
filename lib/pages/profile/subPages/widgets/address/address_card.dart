import 'package:flutter/material.dart';

import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'model/address_model.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const AddressCard({
    super.key,
    required this.address,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(LucideIcons.mapPin, color: AppColors.textPrimary),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.placeType, style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(address.city, style: TextStyle(color: AppColors.textSecondary)),
                  if (address.note.isNotEmpty)
                    Text(address.note, style: TextStyle(color: AppColors.textSecondary)),
                  if (address.muhalla.isNotEmpty)
                    Text("Muhalla: ${address.muhalla}", style: TextStyle(color: AppColors.textSecondary)),
                  if (address.deliveryDetails.isNotEmpty)
                    Text("Details: ${address.deliveryDetails}", style: TextStyle(color: AppColors.textSecondary)),
                  if (address.doorInfo.isNotEmpty)
                    Text("Door Info: ${address.doorInfo}", style: TextStyle(color: AppColors.textSecondary)),
                  if (address.landmark.isNotEmpty)
                    Text("Landmark: ${address.landmark}", style: TextStyle(color: AppColors.textSecondary)),
                  if (address.gatedCommunity)
                    Text("Gated Community", style: TextStyle(color: AppColors.textSecondary)),
                  if (address.entryCode != null)
                    Text("Code: ${address.entryCode}", style: TextStyle(color: AppColors.textSecondary)),
                  if (address.entryOther != null)
                    Text("Other: ${address.entryOther}", style: TextStyle(color: AppColors.textSecondary)),
                  if (address.additionalInstructions != null)
                    Text("Instructions: ${address.additionalInstructions}", style: TextStyle(color: AppColors.textSecondary)),
                  Text("Label: ${address.label}", style: TextStyle(color: AppColors.textSecondary)),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, size: 18),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 18),
                  onPressed: onDelete,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';
import 'package:lucide_icons/lucide_icons.dart';

class h_CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const h_CustomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(40); // taller for 2-line

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(LucideIcons.mapPin, color: AppColors.textPrimary, size: 20),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: AppWeights.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '10/50 C Lane 6',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: AppWeights.regular,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: const [
        Icon(CupertinoIcons.heart, color: AppColors.textPrimary, size: 20),
        SizedBox(width: 16),
        Icon(CupertinoIcons.bag, color: AppColors.textPrimary, size: 20),
        SizedBox(width: 16),
      ],
    );
  }
}

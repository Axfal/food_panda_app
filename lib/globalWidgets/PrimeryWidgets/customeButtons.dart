import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:flutter/material.dart';
import '../../Utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color bgcolor;
  final Color color;
  final String text;
  final VoidCallback onTap;
  final bool border;

  const CustomButton({
    super.key,
    this.bgcolor = AppColors.primary,
    required this.text,
    required this.onTap,
    this.color = AppColors.white,
    this.border = false,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: border
          ? const BorderSide(color: AppColors.black, width: 1)
          : BorderSide.none,
    );

    return SizedBox(
      // width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          padding: const EdgeInsets.symmetric(vertical: 14,),
          shape: shape,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: AppWeights.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/constants/appWeight.dart';
import '../../../Utils/constants/app_colors.dart';
import '../../../globalWidgets/PrimeryWidgets/customeButtons.dart';

class BaseFormPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final Widget content;
  final String buttonText;
  final VoidCallback onButtonTap;

  const BaseFormPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.buttonText,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(imagePath, height: 55, fit: BoxFit.contain),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: AppWeights.extraBold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(subtitle, style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 20),

              /// Dynamic form content here
              content,

              const Spacer(),
              const Divider(),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: CustomButton(text: buttonText, onTap: onButtonTap),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

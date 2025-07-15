import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utils/constants/appWeight.dart';
import '../../../Utils/constants/app_colors.dart';

class InfoPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final List<Widget> actionButtons;

  const InfoPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(imagePath, height: 55, fit: BoxFit.contain),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: AppWeights.extraBold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: actionButtons.map((btn) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: btn,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

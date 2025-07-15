import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utils/constants/app_colors.dart';
import '../../../Utils/constants/appWeight.dart';

class CustomTopBar extends StatelessWidget {
  final String heading;
  final String subheading;
  final String imagePath;
  final bool newRes;

  const CustomTopBar({
    super.key,
    required this.heading,
    required this.subheading,
    required this.imagePath,
    this.newRes = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 18),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Color.fromARGB(255, 254, 218, 160)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 6, right: 12),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      size: 26,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Text(
                  heading,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: AppWeights.extraBold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subheading,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Conditional image shape
          newRes
              ? CircleAvatar(
                  radius: 46,
                  backgroundColor: AppColors.lightPink,
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
        ],
      ),
    );
  }
}

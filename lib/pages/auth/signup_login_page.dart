import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/constants/appWeight.dart';
import 'email_page.dart';

class SignupLoginPage extends StatefulWidget {
  const SignupLoginPage({super.key});

  @override
  State<SignupLoginPage> createState() => _SignupLoginPageState();
}

class _SignupLoginPageState extends State<SignupLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Color.fromARGB(255, 252, 35, 125),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "With up to 30% off. foodpanda sambhal le ga!",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: AppWeights.extraBold,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  "assets/images/sign_up_panda.jpeg",
                  height: 300,
                  width: 300,
                ),
              ],
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign up or Log in",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: AppWeights.extraBold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Select your preferred method to continue",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _customAuthButton(
                    text: "Continue with Google",
                    color: AppColors.white,

                    icon: Icons.g_mobiledata_outlined,

                    onTap: () {},
                  ),
                  _customAuthButton(
                    text: "Continue with Facebook",
                    color: const Color(0xFF1877F2),
                    iconColor: AppColors.white,
                    icon: Icons.facebook_rounded,
                    onTap: () {},
                  ),
                  Divider(),
                  _customAuthButton(
                    text: "Continue with email",
                    color: AppColors.white,
                    icon: Icons.mail_outline_rounded,
                    iconColor: AppColors.primary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => EmailPage()),
                      );
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      text: "By continuing, you agree to our ",
                      children: [
                        TextSpan(
                          text: "Terms and Conditions",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customAuthButton({
    required String text,
    required Color color,
    IconData? icon, // optional icon
    Color? iconColor, // optional icon color
    String? imageAssetPath, // optional image path
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: AppColors.textSecondary.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (imageAssetPath != null)
              Image.asset(imageAssetPath, height: 24, width: 24)
            else if (icon != null)
              Icon(icon, color: iconColor ?? Colors.black),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: GoogleFonts.montserrat())),
          ],
        ),
      ),
    );
  }
}

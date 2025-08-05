import 'package:excellent_trade_app/config/components/round_button_widget.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/pages/profile/subPages/widgets/email_text_field.dart';
import 'package:excellent_trade_app/pages/profile/subPages/widgets/name_text_field.dart';
import 'package:excellent_trade_app/pages/profile/subPages/widgets/phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: MyAppBar(
        title: 'Profile',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image + Info
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.primary.withValues(alpha: 0.099),
                          child: Icon(Icons.person, size: 55, color: AppColors.primary,),
                        ),
                        Positioned(
                          right: 4,
                          bottom: 5,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: const Icon(Icons.edit, size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Muhammad Anfal",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "anfalshah72@gmail.com",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Form Fields
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Edit Info',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      NameTextField(),
                      const SizedBox(height: 16),
                      EmailTextField(),
                      const SizedBox(height: 16),
                      PhoneTextField(),
                      const SizedBox(height: 32),
                      RoundButton(
                        title: "Save",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            // Save logic
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

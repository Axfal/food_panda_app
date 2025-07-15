import 'package:flutter/material.dart';

import 'verify_email_page.dart';
import 'widgets/base_form_page.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFormPage(
      imagePath: "assets/images/icons/mail_icon.jpeg",
      title: "What's your email?",
      subtitle: "We'll check if you have an account",
      buttonText: "Continue",
      onButtonTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VerifyEmailPage()),
        );
      },
      content: TextFormField(
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'varify_number_option_page.dart';
import 'widgets/base_form_page.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFormPage(
      imagePath: "assets/images/icons/mobile_verification_icon.jpeg",
      title: "Whats your mobile number?",
      subtitle: "We need this to verify and secure your account",
      buttonText: "Continue",
      onButtonTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VarifyNumberOptionPage()),
        );
      },
      content: IntlPhoneField(
        decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        initialCountryCode: 'PK', // default Pakistan
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      ),
    );
  }
}

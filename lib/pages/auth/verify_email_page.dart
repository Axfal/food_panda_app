import 'package:flutter/material.dart';
import '../../globalWidgets/PrimeryWidgets/customeButtons.dart';
import 'sent_eamil_varification.dart';
import 'widgets/info_page.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoPage(
      imagePath: "assets/images/icons/mail_icon.jpeg",
      title: "Verify your Email address to get started",
      subtitle: "This helps us mitigate fraud and keep your personal data safe",
      actionButtons: [
        SizedBox(
          width: double.infinity,
          height: 45,
          child: CustomButton(
            text: 'Send Verification Email',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SentEamilVarification()),
              );
            },
          ),
        ),
      ],
    );
  }
}

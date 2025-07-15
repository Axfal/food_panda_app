import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../globalWidgets/PrimeryWidgets/customeButtons.dart';
import 'name_page.dart';
import 'widgets/info_page.dart';

class SentEamilVarification extends StatelessWidget {
  const SentEamilVarification({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoPage(
      imagePath: "assets/images/icons/mail_icon.jpeg",
      title: "We've sent a verification link to abs@example.com",
      subtitle: "Please click the varification in your inbox",
      actionButtons: [
        SizedBox(
          width: double.infinity,
          height: 45,
          child: CustomButton(
            text: 'Check inbox',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NamePage()),
              );
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: CustomButton(
            bgcolor: AppColors.white,
            color: AppColors.black,
            border: true,
            text: 'Resend verification link',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NamePage()),
              );
            },
          ),
        ),
      ],
    );
  }
}

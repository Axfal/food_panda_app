import 'package:excellent_trade_app/pages/auth/forgot_password/verify_otp/verify_otp_export.dart';

class VerifyButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const VerifyButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: "Verify",
      onPress: () {
        if (formKey.currentState!.validate()) {}
      },
    );
  }
}



import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';

class ForgotButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ForgotButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: "Send Code",
      onPress: () {
        if (formKey.currentState!.validate()) {
          Navigator.pushNamed(context, RoutesName.verifyOtp);
        }
      },
    );
  }
}

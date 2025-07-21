import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class SignupButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignupButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: "Create Account",
      onPress: () {
        if (formKey.currentState!.validate()) {}
      },
    );
  }
}

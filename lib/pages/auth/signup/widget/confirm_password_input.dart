import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';


class ConfirmPasswordInput extends StatefulWidget {
  const ConfirmPasswordInput({super.key});

  @override
  State<ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  final FocusNode focusNode = FocusNode();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "Confirm Password",
      hintText: "Enter Confirm Password",
      controller: confirmPassword,
      focusNode: focusNode,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}

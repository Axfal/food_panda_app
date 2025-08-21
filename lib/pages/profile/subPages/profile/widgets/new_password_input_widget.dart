import 'package:excellent_trade_app/config/components/custom_text_field.dart';

import '../profile_export.dart';

class NewPasswordInputWidget extends StatefulWidget {
  const NewPasswordInputWidget({super.key});

  @override
  State<NewPasswordInputWidget> createState() => _NewPasswordInputWidgetState();
}

class _NewPasswordInputWidgetState extends State<NewPasswordInputWidget> {
  final newPasswordController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "New Password",
      hintText: "Enter your new password",
      controller: newPasswordController,
      focusNode: focusNode,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}

import 'package:excellent_trade_app/config/components/custom_text_field.dart';

import '../profile_export.dart';

class OldPasswordInputWidget extends StatefulWidget {
  const OldPasswordInputWidget({super.key});

  @override
  State<OldPasswordInputWidget> createState() => _OldPasswordInputWidgetState();
}

class _OldPasswordInputWidgetState extends State<OldPasswordInputWidget> {
  final oldPasswordController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return CustomTextField(label: 'Old Password',
        hintText: "Enter your old password",
        controller: oldPasswordController,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next);
  }
}

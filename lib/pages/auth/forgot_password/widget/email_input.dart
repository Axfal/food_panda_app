import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: AppLocalizations.of(context)!.email,
      hintText: 'anfal@gmail.com',
      prefixIcon: Icons.email_outlined,
      controller: emailController,
      focusNode: focusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) return 'Enter email';
        if (!value.emailValidator()) return 'Email is not correct';
        return null;
      },
    );
  }
}

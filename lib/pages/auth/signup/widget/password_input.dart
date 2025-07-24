import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (current, previous) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
          label: "Password",
          hintText: "Enter Password",
          controller: passwordController,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          obscureText: _isObscured,
          suffixIcon: _isObscured ? Icons.visibility_off : Icons.visibility,
          onSuffixTap: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter password';
            } else if (value.length < 8) {
              return 'Password must be at least 8 characters';
            } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
              return 'Password must contain at least one uppercase letter';
            } else if (!RegExp(r'[a-z]').hasMatch(value)) {
              return 'Password must contain at least one lowercase letter';
            } else if (!RegExp(r'[0-9]').hasMatch(value)) {
              return 'Password must contain at least one number';
            } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
              return 'Password must contain at least one special character';
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}

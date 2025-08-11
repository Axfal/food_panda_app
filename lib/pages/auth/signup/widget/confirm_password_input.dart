import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class ConfirmPasswordInput extends StatefulWidget {
  const ConfirmPasswordInput({super.key});

  @override
  State<ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  final FocusNode focusNode = FocusNode();
  final confirmPassword = TextEditingController();
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (current, previous) =>
          current.confirmPassword != previous.confirmPassword,
      builder: (context, state) {
        return CustomTextField(
          label: "Confirm Password",
          hintText: "Enter Confirm Password",
          controller: confirmPassword,
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
                return 'Enter confirm password';
              } else if (value.length < 8) {
                return 'Confirm Password must be at least 8 characters';
              } else {
                return null;
              }
            },
          onChanged: (value){
            context.read<SignupBloc>().add(ConfirmPasswordChange(confirmPasswordChange: value));
          },

        );
      },
    );
  }
}

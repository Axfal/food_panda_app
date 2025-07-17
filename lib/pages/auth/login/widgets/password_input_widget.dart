import 'package:excellent_trade_app/pages/auth/login/login_exports.dart';

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    focusNode.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final helperText = AppLocalizations.of(context)!.passwordShouldbeatleast_characterswithatleastoneletterandnumber;

    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => false,
      builder: (context, state) {
        return CustomTextField(
          label: AppLocalizations.of(context)!.password,
          hintText: '',
          prefixIcon: Icons.lock_outline,
          suffixIcon: _obscureText ? Icons.visibility_off : Icons.visibility,
          obscureText: _obscureText,
          controller: passwordController,
          focusNode: focusNode,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return 'please enter password greater than 6 char';
            }
            return null;
          },
          onSuffixTap: _toggleObscure,
          // We use decoration helpers here since CustomTextField doesn't have helperText param.
          // So wrap in a Column for helper text below the field:
        );
      },
    );
  }
}

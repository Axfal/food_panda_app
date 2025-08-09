import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    focusNode.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        // Avoid overwriting if same text
        if (emailController.text != state.email) {
          emailController.text = state.email ?? '';
          emailController.selection = TextSelection.fromPosition(
            TextPosition(offset: emailController.text.length),
          );
        }

        return CustomTextField(
          label: AppLocalizations.of(context)!.email,
          hintText: 'anfal@gmail.com',
          prefixIcon: Icons.email_outlined,
          controller: emailController,
          focusNode: focusNode,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            if (kDebugMode) {
              print('Email typed: $value');
            }
            context.read<SignupBloc>().add(EmailChange(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) return 'Enter email';
            if (!value.emailValidator()) return 'Email is not correct';
            return null;
          },
        );
      },
    );
  }
}

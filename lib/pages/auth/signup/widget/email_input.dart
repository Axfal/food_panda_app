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
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (current, previous) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextField(
          label: AppLocalizations.of(context)!.email,
          hintText: 'anfal@gmail.com',
          prefixIcon: Icons.email_outlined,
          controller: emailController,
          focusNode: focusNode,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            print('Email typed: $value');
            try {
              context.read<SignupBloc>().add(EmailChange(email: value));
            } catch (e) {
              if (kDebugMode) {
                print('Error while dispatching EmailChange: $e');
              }
            }
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

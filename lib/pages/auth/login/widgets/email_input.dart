import 'package:excellent_trade_app/pages/auth/login/login_exports.dart';

class EmailInputWidget extends StatefulWidget {
  const EmailInputWidget({super.key});

  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => false,
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
            context.read<LoginBloc>().add(EmailChanged(email: value));
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

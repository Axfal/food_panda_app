import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';

class ForgotButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ForgotButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listenWhen: (current, previous) =>
          current.signinOtp.status != previous.signinOtp.status,
      listener: (context, state) {
        if (state.signinOtp.status == Status.error) {
          context.flushBarErrorMessage(
            message: state.signinOtp.message.toString(),
          );
        }
        if (state.signinOtp.status == Status.completed) {
          Navigator.pushNamed(context, RoutesName.verifyOtp);
        }
      },
      builder: (context, state) {
        return RoundButton(
          title: "Send Code",
          onPress: () {
            if (formKey.currentState!.validate()) {
              context.read<ForgotPasswordBloc>().add(SigninOtp());
            }
          },
        );
      },
    );
  }
}

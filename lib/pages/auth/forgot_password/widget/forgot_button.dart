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
          context.flushBarSuccessMessage(
            message: state.signinOtp.data.toString(),
          );

          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamed(
              context,
              RoutesName.verifyOtp,
              arguments: context.read<ForgotPasswordBloc>(),
            );
          });
        }
      },
      builder: (context, state) {
        return RoundButton(
          title: "Send Code",
          loading: state.signinOtp.status == Status.loading,
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

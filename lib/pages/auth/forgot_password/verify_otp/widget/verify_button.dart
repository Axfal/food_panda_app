import '../../forget_password_export.dart';

class VerifyButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const VerifyButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listenWhen: (previous, current) =>
      previous.verifyOtp.status != current.verifyOtp.status,
      listener: (context, state) {
        if (state.verifyOtp.status == Status.error) {
          context.flushBarErrorMessage(
            message: state.verifyOtp.message.toString(),
          );
        } else if (state.verifyOtp.status == Status.completed) {
          context.flushBarSuccessMessage(
            message: state.verifyOtp.data.toString(),
          );
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.home,
                  (route) => false,
            );
          });
        }
      },
      builder: (context, state) {
        return RoundButton(
          title: "Verify",
          loading: state.verifyOtp.status == Status.loading,
          onPress: () {
            if (formKey.currentState!.validate()) {
              context.read<ForgotPasswordBloc>().add(VerifyOtp());
            }
          },
        );
      },
    );
  }
}

import '../../forget_password_export.dart';

class VerifyButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const VerifyButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return RoundButton(
          title: "Verify",
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

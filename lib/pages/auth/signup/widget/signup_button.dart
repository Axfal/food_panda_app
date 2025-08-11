import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class SignupButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignupButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupStates>(
      listenWhen: (previous, current) =>
          previous.signupApi != current.signupApi,
      listener: (context, state) {
        if (state.signupApi.status == Status.error) {
          context.flushBarErrorMessage(
            message: state.signupApi.message ?? "Something went wrong",
          );
        }
        if (state.signupApi.status == Status.completed &&
            (state.signupApi.message?.isNotEmpty ?? false)) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.login,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return RoundButton(
          title: "Create Account",
          loading: state.signupApi.status == Status.loading,
          onPress: () {
            if (formKey.currentState!.validate()) {
              context.read<SignupBloc>().add(SignupApi());
            }
          },
        );
      },
    );
  }
}

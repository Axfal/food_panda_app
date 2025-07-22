import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class SignupButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignupButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupStates>(
      buildWhen: (current, previous) =>
          current.signupApi.status != previous.signupApi.status,
      listener: (context, state) {
        if (formKey.currentState!.validate()) {
          if (state.signupApi.status == Status.error) {
            context.flushBarErrorMessage(
              message: state.signupApi.message.toString(),
            );
          }
        }
        if (state.signupApi.status == Status.completed) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.login,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return RoundButton(title: "Create Account", onPress: () {
          context.read<SignupBloc>().add(SignupApi());
        });
      },
    );
  }
}

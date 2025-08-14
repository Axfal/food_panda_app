import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class SignupButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignupButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupStates>(
      listenWhen: (previous, current) =>
          previous.signupApi != current.signupApi &&
          current.userId != previous.userId,
      listener: (context, state) {
        if (state.signupApi.status == Status.error) {
          context.flushBarErrorMessage(
            message: state.signupApi.message ?? "Something went wrong",
          );
        }
        if (state.signupApi.status == Status.completed) {
          if (state.role == 'restaurant_owner') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.registerRestaurant,
              arguments: {'user_id': state.userId},
              (route) => false,
            );
          } else {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.login,
              (route) => false,
            );
          }
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

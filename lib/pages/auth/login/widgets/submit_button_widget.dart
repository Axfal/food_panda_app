import 'package:excellent_trade_app/pages/auth/login/login_exports.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listenWhen: (current, previous) =>
          current.loginApi.status != previous.loginApi.status,
      listener: (context, state) {
        if (state.loginApi.status == Status.error) {
          context.flushBarErrorMessage(
            message: state.loginApi.message.toString(),
          );
        }

        if (state.loginApi.status == Status.completed) {
          if (SessionController.userRole == 'restaurant_owner') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.restaurantOwner,
              (route) => false,
            );
          } else {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.home,
              (route) => false,
            );
          }
        }
      },
      builder: (context, state) {
        return RoundButton(
          title: 'Login',
          loading: state.loginApi.status == Status.loading,
          onPress: () {
            if (formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(const LoginApi());
            }
          },
        );
      },
    );
  }
}

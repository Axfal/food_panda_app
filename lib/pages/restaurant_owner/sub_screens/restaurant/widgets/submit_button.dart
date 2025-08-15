import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/config/components/round_button_widget.dart';
import '../restaurant_exports.dart';

class SubmitButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String userId;

  const SubmitButton({super.key, required this.formKey, required this.userId});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantBloc, RestaurantStates>(
      listenWhen: (previous, current) =>
          previous.registerRestaurantApi.status !=
          current.registerRestaurantApi.status,
      listener: (context, state) {
        final api = state.registerRestaurantApi;

        if (api.status == Status.error && (api.message?.isNotEmpty ?? false)) {
          context.flushBarErrorMessage(message: api.message!);
        } else if (api.status == Status.completed) {
          final successMessage =
              api.data?.toString() ?? 'Registration successful';

          context.flushBarSuccessMessage(message: successMessage);

          if (SessionController.isLogin) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.myRestaurant,
                    (route) => false,
              );
            });
          } else {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.login,
                (route) => false,
              );
            });
          }
        }
      },
      builder: (context, state) {
        return RoundButton(
          title: 'Submit',
          loading: state.registerRestaurantApi.status == Status.loading,
          onPress: () async {
            final isValid = widget.formKey.currentState?.validate() ?? false;
            if (isValid) {
              context.read<RestaurantBloc>().add(
                SubmitFormEvent(ownerId: widget.userId),
              );
            }
          },
        );
      },
    );
  }
}

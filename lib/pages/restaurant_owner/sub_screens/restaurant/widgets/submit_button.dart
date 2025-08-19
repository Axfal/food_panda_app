import 'package:animate_do/animate_do.dart';
import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/config/components/round_button_widget.dart';
import 'package:excellent_trade_app/model/vender/restaurant/restaurant_model.dart';
import '../restaurant_exports.dart';

class SubmitButton extends StatefulWidget {
  final Restaurant? restaurant;
  final GlobalKey<FormState> formKey;
  final String userId;

  const SubmitButton({
    super.key,
    required this.formKey,
    required this.userId,
    this.restaurant,
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool isUpdate = false;

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
          final successMessage = isUpdate
              ? 'Restaurant updated successfully'
              : 'Restaurant registered successfully';

          context.flushBarSuccessMessage(message: successMessage);

          Future.delayed(const Duration(seconds: 2), () {
            if (SessionController.isLogin) {
              Navigator.pushReplacementNamed(context, RoutesName.myRestaurant);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.login,
                (route) => false,
              );
            }
          });
        }
      },
      builder: (context, state) {
        return RoundButton(
          title: widget.restaurant != null ? 'Update' : 'Save',
          loading: state.registerRestaurantApi.status == Status.loading,
          onPress: () async {
            final isValid = widget.formKey.currentState?.validate() ?? false;
            if (isValid) {
              if (widget.restaurant != null) {
                setState(() => isUpdate = true);
                context.read<RestaurantBloc>().add(
                  UpdateRestaurantEvent(id: widget.restaurant!.id),
                );
              } else {
                setState(() => isUpdate = false);
                context.read<RestaurantBloc>().add(
                  SubmitFormEvent(ownerId: widget.userId),
                );
              }
            }
          },
        );
      },
    );
  }
}

import '../restaurant_exports.dart';

class NameInputWidget extends StatefulWidget {
  const NameInputWidget({super.key});

  @override
  State<NameInputWidget> createState() => _NameInputWidgetState();
}

class _NameInputWidgetState extends State<NameInputWidget> {
  final nameController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantStates>(
      buildWhen: (current, previous) =>
          current.restaurantName != previous.restaurantName,
      builder: (context, state) {
        return CustomTextField(
          label: "Restaurant Name",
          hintText: "Enter Your Restaurant Name",
          controller: nameController,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Restaurant name is required";
            }
            if (value.trim().length < 3) {
              return "Name must be at least 3 characters";
            }
            return null;
          },

          onChanged: (value) {
            context.read<RestaurantBloc>().add(
              RestaurantNameChangeEvent(restaurantName: value),
            );
          },
        );
      },
    );
  }
}

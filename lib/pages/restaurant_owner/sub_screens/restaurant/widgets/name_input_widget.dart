import '../restaurant_exports.dart';

class NameInputWidget extends StatefulWidget {
  final String? name;
  const NameInputWidget({super.key, this.name});

  @override
  State<NameInputWidget> createState() => _NameInputWidgetState();
}

class _NameInputWidgetState extends State<NameInputWidget> {
  final TextEditingController nameController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Pre-fill from previous screen OR bloc state if available
    if (widget.name != null && widget.name!.isNotEmpty) {
      nameController.text = widget.name!;
      context.read<RestaurantBloc>().add(
        RestaurantNameChangeEvent(restaurantName: widget.name!),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantStates>(
      buildWhen: (previous, current) =>
      previous.restaurantName != current.restaurantName,
      builder: (context, state) {
        // Keep controller synced with bloc state
        if (state.restaurantName.isNotEmpty &&
            state.restaurantName != nameController.text) {
          nameController.text = state.restaurantName;
          nameController.selection = TextSelection.fromPosition(
            TextPosition(offset: nameController.text.length),
          );
        }

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
              RestaurantNameChangeEvent(restaurantName: value.trim()),
            );
          },
        );
      },
    );
  }
}

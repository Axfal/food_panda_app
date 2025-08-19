import '../restaurant_exports.dart';

class DescriptionInputWidget extends StatefulWidget {
  final String? description;
  const DescriptionInputWidget({super.key, this.description});

  @override
  State<DescriptionInputWidget> createState() => _DescriptionInputWidgetState();
}

class _DescriptionInputWidgetState extends State<DescriptionInputWidget> {
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Prefill from previous screen
    if (widget.description != null && widget.description!.isNotEmpty) {
      descriptionController.text = widget.description!;
      context.read<RestaurantBloc>().add(
        DescriptionChangeEvent(description: widget.description!),
      );
    }
  }

  @override
  void dispose() {
    descriptionController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RestaurantBloc, RestaurantStates>(
      listenWhen: (previous, current) =>
      previous.description != current.description,
      listener: (context, state) {
        if (state.description.isNotEmpty &&
            state.description != descriptionController.text) {
          descriptionController.text = state.description;
          descriptionController.selection = TextSelection.fromPosition(
            TextPosition(offset: descriptionController.text.length),
          );
        }
      },
      child: CustomTextField(
        label: "Description",
        hintText: "Enter Description",
        controller: descriptionController,
        focusNode: focusNode,
        maxLines: 5,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Description is required";
          }
          if (value.trim().length < 10) {
            return "Description must be at least 10 characters";
          }
          return null;
        },
        onChanged: (value) {
          context.read<RestaurantBloc>().add(
            DescriptionChangeEvent(description: value.trim()),
          );
        },
      ),
    );
  }
}

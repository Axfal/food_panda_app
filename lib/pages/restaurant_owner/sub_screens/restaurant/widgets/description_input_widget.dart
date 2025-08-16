import '../restaurant_exports.dart';

class DescriptionInputWidget extends StatefulWidget {
  final String? description;
  const DescriptionInputWidget({super.key, this.description});

  @override
  State<DescriptionInputWidget> createState() => _DescriptionInputWidgetState();
}

class _DescriptionInputWidgetState extends State<DescriptionInputWidget> {
  late final TextEditingController descriptionController;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController(
      text: widget.description ?? '',
    );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantStates>(
      buildWhen: (previous, current) =>
      previous.description != current.description,
      builder: (context, state) {
        return CustomTextField(
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
            return null;
          },
          onChanged: (value) {
            context.read<RestaurantBloc>().add(
              DescriptionChangeEvent(description: value),
            );
          },
        );
      },
    );
  }
}

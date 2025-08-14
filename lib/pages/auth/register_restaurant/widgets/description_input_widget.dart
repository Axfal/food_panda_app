import '../restaurant_exports.dart';

class DescriptionInputWidget extends StatefulWidget {
  const DescriptionInputWidget({super.key});

  @override
  State<DescriptionInputWidget> createState() => _DescriptionInputWidgetState();
}

class _DescriptionInputWidgetState extends State<DescriptionInputWidget> {
  final descriptionController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterRestaurantBloc, RegisterRestaurantStates>(
      buildWhen: (current, previous) =>
          current.description != previous.description,
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
            context.read<RegisterRestaurantBloc>().add(
              DescriptionChangeEvent(description: value),
            );
          },
        );
      },
    );
  }
}

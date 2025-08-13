import '../restaurant_exprots.dart';

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
    return CustomTextField(
      label: "Description",
      hintText: "Enter Description",
      controller: descriptionController,
      focusNode: focusNode,
      maxLines: 5,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}

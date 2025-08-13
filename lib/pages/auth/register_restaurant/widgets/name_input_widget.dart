import '../restaurant_exprots.dart';

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
    return CustomTextField(
      label: "Restaurant Name",
      hintText: "Enter Your Restaurant Name",
      controller: nameController,
      focusNode: focusNode,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}

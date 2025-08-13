import '../restaurant_exprots.dart';

class AddressInputWidget extends StatefulWidget {
  const AddressInputWidget({super.key});

  @override
  State<AddressInputWidget> createState() => _AddressInputWidgetState();
}

class _AddressInputWidgetState extends State<AddressInputWidget> {
  final addressController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'Address',
      hintText: "Enter your address",
      controller: addressController,
      focusNode: focusNode,
      maxLines: 2,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../config/components/custom_text_field.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final nameController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return CustomTextField(label: 'Name',
        hintText: 'Enter your name',
        controller: nameController,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next
    );
  }
}

import 'package:flutter/material.dart';

import '../home/home_page.dart';
import 'widgets/base_form_page.dart';

class VarifyNumberPage extends StatefulWidget {
  const VarifyNumberPage({super.key});

  @override
  State<VarifyNumberPage> createState() => _VarifyNumberPageState();
}

class _VarifyNumberPageState extends State<VarifyNumberPage> {
  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers = List.generate(
      4,
      (index) => TextEditingController(),
    );
    final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
    return BaseFormPage(
      imagePath: "assets/images/icons/msg_varification_icon.jpeg",
      title: "Varify your mobile number",
      subtitle: "We need this to verify and secure your account",
      buttonText: "Continue",
      onButtonTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      },
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return SizedBox(
            width: 55,
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
            ),
          );
        }),
      ),
    );
  }
}

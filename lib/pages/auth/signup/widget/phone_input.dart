import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({super.key});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomPhoneField(
      label: 'Phone Number',
      hintText: 'Enter phone number',
      controller: phoneController,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onChanged: (phone) {
        if (phone.isEmpty) {
          return 'Please Enter Phone Number';
        }
      },
    );
  }
}

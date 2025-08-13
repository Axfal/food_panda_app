import 'package:excellent_trade_app/config/components/custom_phone_field.dart';

import '../restaurant_exprots.dart';

class PhoneInputWidget extends StatefulWidget {
  const PhoneInputWidget({super.key});

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  final phoneController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return CustomPhoneField(
      label: "Phone Number",
      hintText: "Enter your phone number",
      controller: phoneController,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
    );
  }
}

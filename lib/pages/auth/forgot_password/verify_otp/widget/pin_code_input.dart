import 'package:excellent_trade_app/pages/auth/forgot_password/verify_otp/verify_otp_export.dart';

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({super.key});

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  final pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomPinCodeField(controller: pinCodeController, length: 6);
  }
}

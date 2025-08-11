import '../../forget_password_export.dart';

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({super.key});

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  final pinCodeController = TextEditingController();

  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.pinCode != current.pinCode,
      builder: (context, state) {
        return CustomPinCodeField(
          controller: pinCodeController,
          length: 6,
          onChanged: (value) {
            context.read<ForgotPasswordBloc>().add(
              PinCodeChange(pinCode: value),
            );
          },
        );
      },
    );
  }
}

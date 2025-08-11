import 'dart:async';

import '../../forget_password_export.dart';

class ResendCodeButton extends StatefulWidget {
  const ResendCodeButton({super.key});

  @override
  State<ResendCodeButton> createState() => _ResendCodeButtonState();
}

class _ResendCodeButtonState extends State<ResendCodeButton> {
  bool isCooldown = false;
  int cooldownSeconds = 30;
  Timer? _timer;

  void _startCooldown() {
    setState(() {
      isCooldown = true;
      cooldownSeconds = 30;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (cooldownSeconds > 1) {
        setState(() => cooldownSeconds--);
      } else {
        timer.cancel();
        setState(() => isCooldown = false);
      }
    });
  }

  void _resendCode(BuildContext context) {
    context.read<ForgotPasswordBloc>().add(SigninOtp());
    _startCooldown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return TextButton(
          onPressed: isCooldown ? null : () => _resendCode(context),
          child: Text(
            isCooldown
                ? "Wait $cooldownSeconds sec"
                : "Resend Code",
            style: TextStyle(
              color: isCooldown ? Colors.grey : AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}

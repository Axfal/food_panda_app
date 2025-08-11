import 'package:excellent_trade_app/bloc/auth/forgot_password/forgot_password_bloc.dart';
import 'package:excellent_trade_app/dependency_injection/locator.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/verify_otp/verify_otp_export.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/verify_otp/widget/resend_code_button.dart';

import '../forget_password_export.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late ForgotPasswordBloc _forgotPasswordBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _forgotPasswordBloc = ForgotPasswordBloc(authApiRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _forgotPasswordBloc,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),

                      Image.asset(
                        'assets/logo/bike.png',
                        height: 140,
                        width: 140,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 24),

                      Text(
                        "Verify Code",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Enter the 6-digit code sent to your email.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),

                      const SizedBox(height: 32),

                      const PinCodeInput(),

                      const SizedBox(height: 24),

                      VerifyButton(formKey: _formKey),

                      const SizedBox(height: 16),

                      ResendCodeButton(),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

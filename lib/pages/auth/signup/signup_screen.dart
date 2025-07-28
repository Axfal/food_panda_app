import 'package:excellent_trade_app/dependency_injection/locator.dart';
import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late SignupBloc _signupBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signupBloc = SignupBloc(authApiRepository: getIt());
  }

  @override
  void dispose() {
    _signupBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _signupBloc,
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
                      const SizedBox(height: 5),
                      Image.asset(
                        'assets/logo/app_logo.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 15),

                      const UserNameInput(),
                      const SizedBox(height: 15),

                      const EmailInput(),
                      const SizedBox(height: 15),

                      const PhoneInput(),

                      // const SizedBox(height: 15),
                      const PasswordInput(),
                      const SizedBox(height: 15),

                      const ConfirmPasswordInput(),
                      const SizedBox(height: 15),

                      SignupButton(formKey: _formKey),

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),

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

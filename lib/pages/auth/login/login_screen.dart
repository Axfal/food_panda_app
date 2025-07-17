import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:excellent_trade_app/pages/auth/login/login_exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBlocs;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBlocs = LoginBloc(authApiRepository: getIt());
  }

  @override
  void dispose() {
    _loginBlocs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _loginBlocs,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('assets/logo/panda_logo.webp', height: 110),

                      const SizedBox(height: 32),

                      const EmailInputWidget(),

                      const SizedBox(height: 20),

                      const PasswordInputWidget(),

                      const SizedBox(height: 24),

                      LoginButton(formKey: _formKey),

                      const SizedBox(height: 16),

                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to forgot password screen
                        },
                        child: Text(
                          "Forgot Password",
                          // AppLocalizations.of(context)!.forgotPassword,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

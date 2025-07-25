import 'package:flutter/material.dart';
import '../../Utils/constants/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../service/splash/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  final SplashServices splashServices = SplashServices();

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    splashServices.checkAuthentication(context);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final splashText = AppLocalizations.of(context)!.splashScreen;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset('assets/logo/food_bazar_logo.png'),
            ),


            // const SizedBox(height: 24),
            // Text(
            //   splashText,
            //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 22,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}

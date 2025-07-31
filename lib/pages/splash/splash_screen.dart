import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';

import '../../Utils/constants/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../service/splash/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    final splashText = AppLocalizations.of(context)!.splashScreen;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Bike Image (slide-in + bounce)
              SlideInLeft(
                duration: const Duration(milliseconds: 1600),
                child: Bounce(
                  infinite: true,
                  from: 10,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    'assets/logo/bike.png',
                    height: 200.h,
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              // Animated Text (pulsing)
              Pulse(
                infinite: true,
                duration: const Duration(seconds: 2),
                child: Text(
                  splashText,
                  style: GoogleFonts.poppins(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';

import '../../Utils/constants/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../service/splash/splash_service.dart';
import 'package:typewritertext/typewritertext.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

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


              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                blendMode: BlendMode.srcIn,
                child: TypeWriter(
                  controller: TypeWriterController(
                    text: splashText,
                    duration: const Duration(milliseconds: 200),
                  ),
                  builder: (context, value) => Text(
                    value.text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.8,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:excellent_trade_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/auth/signup_login_page.dart';
import 'pages/restaurants/restaurant_deatail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: RestaurantDeatailPage(
          imgpath: 'assets/images/res_logos/burgerLab.png',
          title: 'Burger Lab' + '-' + 'Johar Town',
          rating: 4.5,
          reviewsCount: 4000,
        ),
        //homepage(),
      ),
    );
  }
}

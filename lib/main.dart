import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';
import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';
import 'l10n/app_localizations.dart';
import 'dependency_injection/locator.dart';

ServiceLocator dependencyInjector = ServiceLocator();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjector.servicesLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  themeMode: ThemeMode.dark,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'),
                    Locale('es'),
                  ],
                  initialRoute: RoutesName.splash,
                  onGenerateRoute: Routes.generateRoute,
                );
              },
            );
          },
        );
      },
    );
  }
}

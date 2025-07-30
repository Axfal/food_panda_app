import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter/services.dart';

import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';
import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';
import 'l10n/app_localizations.dart';
import 'dependency_injection/locator.dart';

ServiceLocator dependencyInjector = ServiceLocator();

/// Static flag to ensure single initialization across hot reload/restart
bool _isMapRendererInitialized = false;

/// Initialize map renderer once
Future<void> initializeMapRenderer() async {
  if (_isMapRendererInitialized) {
    // Already initialized, skip
    debugPrint('Map renderer already initialized, skipping...');
    return;
  }

  final mapsImplementation = GoogleMapsFlutterPlatform.instance;

  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    try {
      await mapsImplementation.initializeWithRenderer(AndroidMapRenderer.latest);
      debugPrint('Initialized latest Android Map renderer');
    } on PlatformException catch (e) {
      if (e.message != null && e.message!.contains('Renderer already initialized')) {
        debugPrint('Renderer already initialized error caught, continuing...');
      } else {
        debugPrint('Failed to initialize latest renderer, falling back legacy: $e');
        try {
          await mapsImplementation.initializeWithRenderer(AndroidMapRenderer.legacy);
          debugPrint('Initialized legacy Android Map renderer');
        } catch (legacyError) {
          debugPrint('Legacy renderer initialization failed: $legacyError');
          rethrow;
        }
      }
    }
  }

  _isMapRendererInitialized = true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // call only once here

  dependencyInjector.servicesLocator();

  // Await this once before runApp()
  // await initializeMapRenderer();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

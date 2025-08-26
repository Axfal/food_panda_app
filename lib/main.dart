import 'dart:async';
import 'package:excellent_trade_app/bloc/account/profile/profile_bloc.dart';
import 'package:excellent_trade_app/bloc/location/location_bloc.dart';
import 'package:excellent_trade_app/bloc/vendor/menu_management/menu_management_bloc.dart';
import 'package:excellent_trade_app/bloc/vendor/restaurant/restaurant_bloc.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter/services.dart';
import 'bloc/category/category_bloc.dart';
import 'bloc/restaurant_by_category/restaurant_by_category_bloc.dart';
import 'bloc/restaurant_menu/restaurant_menu_bloc.dart';
import 'config/routes/routes.dart';
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
      await mapsImplementation.initializeWithRenderer(
        AndroidMapRenderer.latest,
      );
      debugPrint('Initialized latest Android Map renderer');
    } on PlatformException catch (e) {
      if (e.message != null &&
          e.message!.contains('Renderer already initialized')) {
        debugPrint('Renderer already initialized error caught, continuing...');
      } else {
        debugPrint(
          'Failed to initialize latest renderer, falling back legacy: $e',
        );
        try {
          await mapsImplementation.initializeWithRenderer(
            AndroidMapRenderer.legacy,
          );
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
  WidgetsFlutterBinding.ensureInitialized();

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
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<RestaurantBloc>(
                      create: (context) =>
                          RestaurantBloc(restaurantApiRepository: getIt()),
                    ),
                    BlocProvider<MenuManagementBloc>(
                      create: (context) =>
                          MenuManagementBloc(vendorApiRepository: getIt()),
                    ),
                    BlocProvider<CategoryBloc>(
                      create: (context) =>
                          CategoryBloc(categoryApiRepository: getIt()),
                    ),
                    BlocProvider<ProfileBloc>(
                      create: (context) =>
                          ProfileBloc(profileApiRepository: getIt()),
                    ),
                    BlocProvider<RestaurantByCategoryBloc>(
                      create: (context) => RestaurantByCategoryBloc(
                        restaurantApiRepository: getIt(),
                      ),
                    ),
                    BlocProvider<RestaurantMenuBloc>(
                      create: (context) =>
                          RestaurantMenuBloc(restaurantApiRepository: getIt()),
                    ),
                    BlocProvider<LocationBloc>(
                      create: (context) =>
                          LocationBloc(locationApiResponse: getIt()),
                    ),
                  ],
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Food mate',
                    themeMode: ThemeMode.dark,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [Locale('en'), Locale('es')],
                    initialRoute: RoutesName.splash,
                    onGenerateRoute: Routes.generateRoute,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

// ignore_for_file: avoid_print

import 'dart:async';
import 'package:excellent_trade_app/bloc/account/profile/profile_bloc.dart';
import 'package:excellent_trade_app/bloc/location/location_bloc.dart';
import 'package:excellent_trade_app/bloc/near_by_restaurant/near_by_restaurant_bloc.dart';
import 'package:excellent_trade_app/bloc/new_restaurant/new_restaurant_bloc.dart';
import 'package:excellent_trade_app/bloc/vendor/menu_management/menu_management_bloc.dart';
import 'package:excellent_trade_app/bloc/vendor/restaurant/restaurant_bloc.dart';
import 'package:excellent_trade_app/bloc/wish_list/wish_list_bloc.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/repository/order/order_api_repository.dart';
import 'package:excellent_trade_app/service/cart/cart_service.dart';
import 'package:excellent_trade_app/service/location/location_storage.dart';
import 'package:excellent_trade_app/service/web_socket_service/web_socket_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter/services.dart';
import 'bloc/cart/cart_bloc.dart';
import 'bloc/category/category_bloc.dart';
import 'bloc/order/order_bloc.dart';
import 'bloc/restaurant_by_category/restaurant_by_category_bloc.dart';
import 'bloc/restaurant_menu/restaurant_menu_bloc.dart';
import 'bloc/search/search_bloc.dart';
import 'config/routes/routes.dart';
import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';
import 'l10n/app_localizations.dart';
import 'dependency_injection/locator.dart';
import 'package:excellent_trade_app/service/permission_handler/permission_service.dart';

ServiceLocator dependencyInjector = ServiceLocator();

Future<void> initializeMapRenderer() async {
  final mapsImplementation = GoogleMapsFlutterPlatform.instance;

  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    try {
      await mapsImplementation.initializeWithRenderer(
        AndroidMapRenderer.latest,
      );
      debugPrint('Latest Android Map renderer initialized');
    } on PlatformException catch (e) {
      if (e.message != null &&
          e.message!.contains('Renderer already initialized')) {
        debugPrint('Renderer already initialized — ignoring');
      } else {
        debugPrint('Renderer init failed, trying legacy: $e');
        try {
          await mapsImplementation.initializeWithRenderer(
            AndroidMapRenderer.legacy,
          );
          debugPrint('Legacy Android Map renderer initialized');
        } catch (legacyError) {
          debugPrint('Legacy renderer initialization failed: $legacyError');
        }
      }
    } catch (e) {
      debugPrint('Unknown error initializing map renderer: $e');
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  dependencyInjector.servicesLocator();

  await LocationSessionController().loadLocation();
  await CartSessionController().loadCart();

  await initializeMapRenderer();
  bool granted = await PermissionsService.requestPermissions();
  if (!granted) {
    print("Permissions denied! Some features may not work.");
  }

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
                    BlocProvider<SearchBloc>(
                      create: (context) =>
                          SearchBloc(searchApiRepository: getIt()),
                    ),
                    BlocProvider<NewRestaurantBloc>(
                      create: (context) =>
                          NewRestaurantBloc(restaurantApiRepository: getIt()),
                    ),
                    BlocProvider(
                      create: (context) =>
                          WishListBloc(wishListApiRepository: getIt()),
                    ),
                    BlocProvider<CartBloc>(create: (context) => CartBloc()),
                    BlocProvider<NearByRestaurantBloc>(
                      create: (context) => NearByRestaurantBloc(
                        restaurantApiRepository: getIt(),
                      ),
                    ),
                    BlocProvider<OrderBloc>(
                      create: (context) => OrderBloc(
                        orderApiRepository: getIt<OrderApiRepository>(),
                        webSocketService: getIt<WebSocketService>(),
                      ),
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

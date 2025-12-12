import 'dart:io';

import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/app_routes_fun.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/cache_helper.dart';
import 'core/services/local_notifications_service.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/phoneix.dart';
import 'core/utils/unfucs.dart';
import 'firebase_options.dart';
import 'models/user.dart';

/// Login
/// phone: 01281160151
///pass: michael123

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await lang.EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  Prefs = await SharedPreferences.getInstance();
  UserModel.i.get();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GlobalNotification().setUpFirebase();
  ServicesLocator().init();
  await CacheHelper.init();
  runApp(const MyApp());
}
ThemeMode _getSavedThemeMode() {
  final savedTheme = Prefs.getString('themeMode') ?? 'system';
  switch (savedTheme) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState(); // remove underscore
}

class MyAppState extends State<MyApp> { // remove underscore
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _themeMode = _getSavedThemeMode();
  }

  void updateThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
    Prefs.setString(
        'themeMode',
        mode == ThemeMode.dark
            ? 'dark'
            : mode == ThemeMode.light
            ? 'light'
            : 'system');
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
      child: lang.EasyLocalization(
        path: 'assets/translations',
        saveLocale: true,
        fallbackLocale: const Locale('en'),
        supportedLocales: const [Locale('ar'), Locale('en')],
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              // themeMode: ThemeMode.system,
              initialRoute: AppRoutes.init.initial,
              routes: AppRoutes.init.appRoutes,
              navigatorKey: navigator,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              themeMode: _themeMode,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              builder: (context, child) {
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  return Scaffold(appBar: AppBar(elevation: 0, backgroundColor: Colors.white));
                };
                return Phoenix(
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.sp)),
                    child: Unfocus(child: child ?? const SizedBox.shrink()),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

late SharedPreferences Prefs;

// ignore: non_constant_identifier_names

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (cert, host, port) => true;
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:go_router/go_router.dart';
import 'package:mdlive_healthcare_app_ui/providers/theme_provider.dart';
import 'package:mdlive_healthcare_app_ui/routes/call.dart';
import 'package:mdlive_healthcare_app_ui/routes/chat.dart';
import 'package:mdlive_healthcare_app_ui/routes/error.dart';
import 'package:mdlive_healthcare_app_ui/routes/home.dart';

import 'data/constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then(appCallback);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var state = ref.watch(themeProvider.select((value) => value));
        log(state.toString());
        return ScreenUtilInit(
          designSize: const Size(448, 998),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: Constants.appName,
            themeMode: condition(state, ThemeMode.light, ThemeMode.dark),
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorSchemeSeed: const Color(0xff23355f),
              fontFamily: FontResoft.poppins,
              package: FontResoft.package,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              typography: Typography.material2021(
                englishLike: Typography.englishLike2018,
              ),
              textTheme: Typography.englishLike2021.apply(
                fontSizeFactor: 1.sp,
                fontFamily: FontResoft.poppins,
                package: FontResoft.package,
              ),
              //textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorSchemeSeed: const Color(0xff23355f),
              fontFamily: FontResoft.poppins,
              package: FontResoft.package,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              typography: Typography.material2021(
                englishLike: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              ),
              textTheme: const TextTheme(bodyMedium: TextStyle()),
            ),
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            shortcuts: {
              ...WidgetsApp.defaultShortcuts,
              const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
            },
            localizationsDelegates: const [],
          ),
          child: child,
        );
      },
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      route(Constants.root, const Home()),
      route(Constants.home, const Home()),
      route(Constants.chat, const Chat()),
      route(Constants.call, const Call()),
      route(Constants.error, const ErrorPage()),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

GoRoute route(String path, Widget route) {
  return routeTransition(path, route);
}

GoRoute routeTransition(String path, Widget route) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage(
      child: route,
      transitionsBuilder: (context, animation, _, child) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOutBack),
        child: child,
      ),
      transitionDuration: const Duration(seconds: 1),
    ),
  );
}

launch(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).push(route, extra: extra);
}

replace(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).replace(route, extra: extra);
}

launchReplace(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).pushReplacement(route, extra: extra);
}

finish(BuildContext context) => GoRouter.of(context).pop();


FutureOr appCallback(void value) {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../configs/configs.dart';
import '../../configs/routes.dart';
import '../../configs/theme.dart';

class App extends ConsumerWidget {
  App({super.key});

  final GoRouter _router = Routes().router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DevicePreview(
      enabled: Configs.devicePreview,
      builder: (context) => Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          themeMode: ThemeConfigs.themeMode,
          theme: ThemeConfigs.lightTheme,
          darkTheme: ThemeConfigs.darkTheme,
        );
      }),
    );
  }
}

initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableLevels = [
    LevelMessages.error,
    LevelMessages.warning
  ];
  runApp(ProviderScope(
    child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        child: App()),
  ));
}

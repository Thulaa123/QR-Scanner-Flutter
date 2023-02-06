import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../configs/routes.dart';
import '../../base/generated/assets/assets.gen.dart';
import '../../base/widgets/app_page.dart';
import '../../configs/configs.dart';
import '../../configs/theme.dart';

final preferencesProvider = FutureProvider((_) async {
  return await SharedPreferences.getInstance();
});

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  _onPageLoad(BuildContext context, WidgetRef ref, int splashScreenDelay) {
    Future.delayed(Duration(seconds: splashScreenDelay), () async {
      String clickval = '';
      final prefs = await SharedPreferences.getInstance();
      clickval = prefs.getString('IntroClicked') ?? '';
      if (clickval.isEmpty) {
        // ignore: use_build_context_synchronously
        context.go(Routes.introPage);
      } else {
        // ignore: use_build_context_synchronously
        context.go(Routes.homePage);
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPage(
        onVisible: () => _onPageLoad(context, ref, Configs.splashScreenDelay),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(ThemeConfigs.defaultAppPadding),
            child: Center(
              child: Assets.images.app.logo.image(
                  cacheWidth: 624,
                  color: Theme.of(context).colorScheme.primary),
            ).animate().fadeIn(delay: 1.seconds),
          ),
        ));
  }
}
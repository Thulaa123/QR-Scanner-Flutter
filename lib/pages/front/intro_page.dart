import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../base/generated/assets/assets.gen.dart';
import '../../base/generated/locale/locale_keys.g.dart';
import '../../base/widgets/app_page.dart';
import '../../configs/routes.dart';
import '../../configs/theme.dart';

final preferencesProvider = FutureProvider((_) async {
  return await SharedPreferences.getInstance();
});

String clickval = '';

class IntroPage extends ConsumerWidget {
  const IntroPage({super.key});

  _loadIntroPages(BuildContext context) {
    return [
      PageViewModel(
        title: LocaleKeys.introPage_intro1_title.tr(),
        body: LocaleKeys.introPage_intro1_body.tr(),
        image: Assets.images.intro.intro1.image(cacheWidth: 590),
        decoration: _getIntroPageDecoration(context),
      ),
      PageViewModel(
        title: LocaleKeys.introPage_intro2_title.tr(),
        body: LocaleKeys.introPage_intro2_body.tr(),
        image: Assets.images.intro.intro2.image(cacheWidth: 590),
        decoration: _getIntroPageDecoration(context),
      ),
      PageViewModel(
        title: LocaleKeys.introPage_intro3_title.tr(),
        body: LocaleKeys.introPage_intro3_body.tr(),
        image: Assets.images.intro.intro3.image(cacheWidth: 590),
        decoration: _getIntroPageDecoration(context),
      ),
      PageViewModel(
        title: LocaleKeys.introPage_intro4_title.tr(),
        body: LocaleKeys.introPage_intro4_body.tr(),
        image: Assets.images.intro.intro4.image(cacheWidth: 590),
        decoration: _getIntroPageDecoration(context),
      )
    ];
  }

  _getIntroPageDecoration(BuildContext context) {
    return PageDecoration(
      imagePadding: const EdgeInsets.all(0),
      titlePadding: EdgeInsets.only(top: 8.h, bottom: 12),
      titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
          fontSize: 20.0),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPage.safeArea(
       
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(ThemeConfigs.defaultAppPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 4.h),
                Center(
                    child: Assets.images.app.logoLong.image(
                        cacheWidth: 216,
                        width: 30.0.w,
                        color: Theme.of(context).colorScheme.primary)),
                SizedBox(height: 4.h),
                Flexible(
                  child: IntroductionScreen(
                    next: Icon(Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.secondary),
                    back: const Icon(
                      Icons.arrow_back,
                    ),
                    pages: _loadIntroPages(context),
                    curve: Curves.fastLinearToSlowEaseIn,
                    showSkipButton: true,
                    dotsDecorator: DotsDecorator(
                      size: const Size(4.0, 4.0),
                      color: Theme.of(context).colorScheme.primary,
                      activeSize: const Size(16.0, 8.0),
                      activeColor: Theme.of(context).colorScheme.secondary,
                      activeShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    ),
                    skip: Text(LocaleKeys.introPage_skip.tr(),
                        key: const Key('buttonSkip'),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.secondary)),
                    done: Text(LocaleKeys.introPage_getStarted.tr(),
                        key: const Key('buttonDone'),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.secondary)),
                    onDone: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('IntroClicked', 'ok');
                      // ignore: use_build_context_synchronously
                      context.go(Routes.homePage);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/generated/locale/locale_keys.g.dart';
import '../../base/widgets/app_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPage.safeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.appName.tr()),
        ),
        body: Center(
          child: Text(LocaleKeys.homePageWelcome.tr(args: ['Flutter'])),
        ),
      ),
    );
  }
}

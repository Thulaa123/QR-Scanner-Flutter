import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lifecycle/lifecycle.dart';

import '../pages/extra/api_call_page.dart';
import '../pages/extra/pocketbase_page.dart';
import '../pages/front/intro_page.dart';
import '../pages/front/splash_page.dart';
import '../pages/home/home_page.dart';

class Routes {
  static const apiCallPage = '/api-call';
  static const pocketBasePage = '/pb-page';
  static const homePage = '/home';
  static const introPage = '/intro';
  static const splashPage = '/';

  GoRouter router = GoRouter(observers: [
    defaultLifecycleObserver
  ], routes: [
    _goRoute(splashPage, const SplashPage()),
    _goRoute(introPage, const IntroPage()),
    _goRoute(homePage, const HomePage()),
    _goRoute(apiCallPage, const APICallPage()),
    _goRoute(pocketBasePage, const PocketBasePage()),
  ]);
}

GoRoute _goRoute(String path, Widget widget) {
  return GoRoute(
      path: path, pageBuilder: (context, state) => MaterialPage(child: widget));
}

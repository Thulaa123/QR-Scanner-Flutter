import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';

class AppPage extends StatelessWidget {
  final Widget child;
  final Function? onPush;
  final Function? onVisible;
  final Function? onAnalytics;
  final Function? onActive;
  final Function? onInactive;
  final Function? onHide;
  final Function? onPop;

  const AppPage(
      {required this.child,
      this.onPush,
      this.onVisible,
      this.onAnalytics,
      this.onActive,
      this.onInactive,
      this.onHide,
      this.onPop,
      Key? key})
      : super(key: key);

  const factory AppPage.safeArea({
    required Widget child,
    Function? onPush,
    Function? onVisible,
    Function? onAnalytics,
    Function? onActive,
    Function? onInactive,
    Function? onHide,
    Function? onPop,
  }) = _PageWithSafeArea;

  @override
  Widget build(BuildContext context) {
    return _withLifecycle(child);
  }

  Widget _withLifecycle(Widget widget) {
    return LifecycleWrapper(
        onLifecycleEvent: (LifecycleEvent event) {
          switch (event) {
            case LifecycleEvent.push:
              if (onPush != null) onPush!();
              break;
            case LifecycleEvent.visible:
              if (onVisible != null) onVisible!();
              if (onAnalytics != null) onAnalytics!();
              break;
            case LifecycleEvent.active:
              if (onActive != null) onActive!();
              break;
            case LifecycleEvent.inactive:
              if (onInactive != null) onInactive!();
              break;
            case LifecycleEvent.invisible:
              if (onHide != null) onHide!();
              break;
            case LifecycleEvent.pop:
              if (onPop != null) onPop!();
              break;
          }
        },
        child: widget);
  }
}

class _PageWithSafeArea extends AppPage {
  const _PageWithSafeArea({
    required Widget child,
    Function? onPush,
    Function? onVisible,
    Function? onAnalytics,
    Function? onActive,
    Function? onInactive,
    Function? onHide,
    Function? onPop,
  }) : super(
            child: child,
            onPush: onPush,
            onVisible: onVisible,
            onAnalytics: onAnalytics,
            onActive: onActive,
            onInactive: onInactive,
            onHide: onHide,
            onPop: onPop);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: super.build(context));
  }
}

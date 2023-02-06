import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/lib/base/core/user.g.dart';

@Riverpod(keepAlive: true)
class AppUserInfo extends _$AppUserInfo {
  @override
  AppUser build() => AppUser();
}

class AppUser {
  String? gender;

  AppUser({
    this.gender,
  });
}

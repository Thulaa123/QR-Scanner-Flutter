import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/api/client.dart';
import '../../app/models/posts/posts.dart';
import '../../base/generated/locale/locale_keys.g.dart';

final _postsProvider = FutureProvider.autoDispose<Posts>(
    (ref) => ref.read(apiProvider).getPosts());

class APICallPage extends ConsumerWidget {
  const APICallPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.apiPage_menuName.tr())),
      body: Center(
        child: ref.watch(_postsProvider).when(
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
              data: (posts) {
                return Text('${posts.items?.last.title}');
              },
            ),
      ),
    );
  }
}

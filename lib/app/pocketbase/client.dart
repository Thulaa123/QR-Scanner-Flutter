import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../configs/pb.dart';
import '../models/posts/posts.dart';
import 'impl_client.dart';

part '../../base/generated/lib/app/pocketbase/client.g.dart';

@Riverpod(keepAlive: true)
PBClient pb(PbRef ref) {
  return PBClientImpl(PBConfig.baseURL, PBConfig.user, PBConfig.pass);
}

abstract class PBClient {
  authenticateUser();

  Future<Posts> getPosts();
}

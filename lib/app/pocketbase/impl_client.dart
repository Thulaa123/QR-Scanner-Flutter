import 'package:pocketbase/pocketbase.dart';

import '../../configs/logger.dart';
import '../models/posts/posts.dart';
import 'client.dart';

class PBClientImpl implements PBClient {
  final String baseUrl;
  final String user;
  final String pass;
  late PocketBase _pb;
  final postsCollection = 'posts';
  final usersCollection = 'users';

  PBClientImpl(this.baseUrl, this.user, this.pass) {
    _pb = PocketBase(baseUrl);
  }

  @override
  authenticateUser() async {
    //await _pb.collection(usersCollection).authWithPassword(user, pass);
    await _pb.admins.authWithPassword(user, pass);
    Log.log.i('Pocketbase User Authenticated');
  }

  @override
  Future<Posts> getPosts() async {
    final result = await _pb
        .collection(postsCollection)
        .getList(sort: '-created', perPage: double.maxFinite.toInt());
    return Posts.fromMap(result.toJson());
  }
}

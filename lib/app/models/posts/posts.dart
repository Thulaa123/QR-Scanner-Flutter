import 'dart:convert';

import 'post.dart';

class Posts {
  int? page;
  int? perPage;
  int? totalPages;
  int? totalItems;
  List<Post>? items;

  Posts({
    this.page,
    this.perPage,
    this.totalPages,
    this.totalItems,
    this.items,
  });

  factory Posts.fromMap(Map<String, dynamic> data) => Posts(
        page: data['page'] as int?,
        perPage: data['perPage'] as int?,
        totalPages: data['totalPages'] as int?,
        totalItems: data['totalItems'] as int?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Post.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'page': page,
        'perPage': perPage,
        'totalPages': totalPages,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Posts].
  factory Posts.fromJson(Map<String, dynamic> data) {
    return Posts.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [Posts] to a JSON string.
  String toJson() => json.encode(toMap());
}

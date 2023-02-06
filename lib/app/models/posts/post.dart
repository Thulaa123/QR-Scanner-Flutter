import 'dart:convert';

class Post {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? title;
  String? description;
  bool? active;
  List<String>? options;
  List<String>? featuredImages;

  Post({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.title,
    this.description,
    this.active,
    this.options,
    this.featuredImages,
  });

  factory Post.fromMap(Map<String, dynamic> data) => Post(
        id: data['id'] as String?,
        collectionId: data['collectionId'] as String?,
        collectionName: data['collectionName'] as String?,
        created: data['created'] as String?,
        updated: data['updated'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        active: data['active'] as bool?,
        options: data['options'].cast<String>() as List<String>?,
        featuredImages: data['featuredImages'].cast<String>() as List<String>?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'collectionId': collectionId,
        'collectionName': collectionName,
        'created': created,
        'updated': updated,
        'title': title,
        'description': description,
        'active': active,
        'options': options,
        'featuredImages': featuredImages,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Post].
  factory Post.fromJson(String data) {
    return Post.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Post] to a JSON string.
  String toJson() => json.encode(toMap());
}

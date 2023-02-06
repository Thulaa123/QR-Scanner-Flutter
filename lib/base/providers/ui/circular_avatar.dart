import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../strings/provider.dart';

class CircularAvatar extends ConsumerWidget {
  const CircularAvatar(
      {super.key, this.profilePicture, this.name, this.imageFile});

  final String? profilePicture;
  final String? name;
  final String? imageFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(stringsProvider);
    if (imageFile != null && imageFile != '') {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(imageFile!)),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
      );
    } else if (profilePicture != null) {
      return SizedBox(
        width: 100,
        height: 100,
        child: CachedNetworkImage(
          imageUrl: profilePicture!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2.0,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      );
    } else {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            strings.getInitials(string: name ?? '-', limitTo: 2),
            style: TextStyle(
                fontSize: 30, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      );
    }
  }
}

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../configs/theme.dart';
import '../../generated/locale/locale_keys.g.dart';

part '../../generated/lib/base/providers/ui/provider.g.dart';

@riverpod
UIProvider ui(UiRef ref) => UIProvider();

class UIProvider {
  getAuthInputDecorator(BuildContext context, String labelText,
      {Widget? icon, Widget? prefix, Widget? suffix, Color? prefixIconColor}) {
    return InputDecoration(
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: icon,
      prefixIconColor: prefixIconColor,
      prefix: prefix,
      suffix: suffix,
      contentPadding: const EdgeInsets.all(16),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).colorScheme.onBackground),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
    );
  }

  getProfileImage(ImageSource imageSource) async {
    final pickedFile = await (ImagePicker().pickImage(source: imageSource));
    CroppedFile? croppedFile = await (ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
        maxWidth: 512,
        maxHeight: 512,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: LocaleKeys.dialogs_cropImage.tr(),
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          )
        ]));
    return File(croppedFile!.path);
  }

  getImageSourceButton(
      ImageSource imageSource, BuildContext context, VoidCallback? onPressed) {
    IconData icon;
    switch (imageSource) {
      case ImageSource.camera:
        icon = Icons.camera_alt;
        break;
      case ImageSource.gallery:
        icon = Icons.photo;
        break;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: ThemeConfigs.pd5x, minHeight: ThemeConfigs.pd5x),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: ThemeConfigs.pd4x,
        ),
      ),
    );
  }
}

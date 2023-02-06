/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesAppGen get app => const $AssetsImagesAppGen();
  $AssetsImagesIntroGen get intro => const $AssetsImagesIntroGen();
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [en];
}

class $AssetsImagesAppGen {
  const $AssetsImagesAppGen();

  /// File path: assets/images/app/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/app/logo.png');

  /// File path: assets/images/app/logo_long.png
  AssetGenImage get logoLong =>
      const AssetGenImage('assets/images/app/logo_long.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, logoLong];
}

class $AssetsImagesIntroGen {
  const $AssetsImagesIntroGen();

  /// File path: assets/images/intro/intro1.png
  AssetGenImage get intro1 =>
      const AssetGenImage('assets/images/intro/intro1.png');

  /// File path: assets/images/intro/intro2.png
  AssetGenImage get intro2 =>
      const AssetGenImage('assets/images/intro/intro2.png');

  /// File path: assets/images/intro/intro3.png
  AssetGenImage get intro3 =>
      const AssetGenImage('assets/images/intro/intro3.png');

  /// File path: assets/images/intro/intro4.png
  AssetGenImage get intro4 =>
      const AssetGenImage('assets/images/intro/intro4.png');

  /// List of all assets
  List<AssetGenImage> get values => [intro1, intro2, intro3, intro4];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsCardGen {
  const $AssetsCardGen();

  /// File path: assets/card/cake-bday.png
  AssetGenImage get cakeBday =>
      const AssetGenImage('assets/card/cake-bday.png');

  /// File path: assets/card/doge-xmas.png
  AssetGenImage get dogeXmas =>
      const AssetGenImage('assets/card/doge-xmas.png');

  /// File path: assets/card/flower.png
  AssetGenImage get flower => const AssetGenImage('assets/card/flower.png');

  /// File path: assets/card/gift-happy.png
  AssetGenImage get giftHappy =>
      const AssetGenImage('assets/card/gift-happy.png');

  /// File path: assets/card/gift-xmas.png
  AssetGenImage get giftXmas =>
      const AssetGenImage('assets/card/gift-xmas.png');

  /// File path: assets/card/happy-bday.png
  AssetGenImage get happyBday =>
      const AssetGenImage('assets/card/happy-bday.png');

  /// File path: assets/card/hohoho.png
  AssetGenImage get hohoho => const AssetGenImage('assets/card/hohoho.png');

  /// File path: assets/card/sock-xmas.png
  AssetGenImage get sockXmas =>
      const AssetGenImage('assets/card/sock-xmas.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        cakeBday,
        dogeXmas,
        flower,
        giftHappy,
        giftXmas,
        happyBday,
        hohoho,
        sockXmas
      ];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/arrowleft.svg
  String get arrowleft => 'assets/icon/arrowleft.svg';

  /// File path: assets/icon/arrowright.svg
  String get arrowright => 'assets/icon/arrowright.svg';

  /// File path: assets/icon/back.svg
  String get back => 'assets/icon/back.svg';

  /// File path: assets/icon/card.svg
  String get card => 'assets/icon/card.svg';

  /// File path: assets/icon/color.svg
  String get color => 'assets/icon/color.svg';

  /// File path: assets/icon/discover.svg
  String get discover => 'assets/icon/discover.svg';

  /// File path: assets/icon/gift-1.svg
  String get gift1 => 'assets/icon/gift-1.svg';

  /// File path: assets/icon/gift.svg
  String get gift => 'assets/icon/gift.svg';

  /// File path: assets/icon/home.svg
  String get home => 'assets/icon/home.svg';

  /// File path: assets/icon/mc.svg
  String get mc => 'assets/icon/mc.svg';

  /// File path: assets/icon/paypal.svg
  String get paypal => 'assets/icon/paypal.svg';

  /// File path: assets/icon/search.svg
  String get search => 'assets/icon/search.svg';

  /// List of all assets
  List<String> get values => [
        arrowleft,
        arrowright,
        back,
        card,
        color,
        discover,
        gift1,
        gift,
        home,
        mc,
        paypal,
        search
      ];
}

class Assets {
  Assets._();

  static const $AssetsCardGen card = $AssetsCardGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

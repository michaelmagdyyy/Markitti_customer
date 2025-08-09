/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/balnce.png
  AssetGenImage get balnce => const AssetGenImage('assets/images/balnce.png');

  /// File path: assets/images/dig.png
  AssetGenImage get dig => const AssetGenImage('assets/images/dig.png');

  /// File path: assets/images/digram.png
  AssetGenImage get digram => const AssetGenImage('assets/images/digram.png');

  /// File path: assets/images/test.png
  AssetGenImage get test => const AssetGenImage('assets/images/test.png');

  /// List of all assets
  List<AssetGenImage> get values => [balnce, dig, digram, test];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/successfully.json
  String get successfully => 'assets/lottie/successfully.json';

  /// List of all assets
  List<String> get values => [successfully];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/arrow.svg
  String get arrow => 'assets/svg/arrow.svg';

  /// File path: assets/svg/back.svg
  String get back => 'assets/svg/back.svg';

  /// File path: assets/svg/branch.svg
  String get branch => 'assets/svg/branch.svg';

  /// File path: assets/svg/camera.svg
  String get camera => 'assets/svg/camera.svg';

  /// File path: assets/svg/client.svg
  String get client => 'assets/svg/client.svg';

  /// File path: assets/svg/desc.svg
  String get desc => 'assets/svg/desc.svg';

  /// File path: assets/svg/edit.svg
  String get edit => 'assets/svg/edit.svg';

  /// File path: assets/svg/gallery.svg
  String get gallery => 'assets/svg/gallery.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/home_filled.svg
  String get homeFilled => 'assets/svg/home_filled.svg';

  /// File path: assets/svg/info.svg
  String get info => 'assets/svg/info.svg';

  /// File path: assets/svg/lang.svg
  String get lang => 'assets/svg/lang.svg';

  /// File path: assets/svg/lock.svg
  String get lock => 'assets/svg/lock.svg';

  /// File path: assets/svg/logo.svg
  String get logo => 'assets/svg/logo.svg';

  /// File path: assets/svg/logout.svg
  String get logout => 'assets/svg/logout.svg';

  /// File path: assets/svg/mode.svg
  String get mode => 'assets/svg/mode.svg';

  /// File path: assets/svg/notifications.svg
  String get notifications => 'assets/svg/notifications.svg';

  /// File path: assets/svg/notifications_filled.svg
  String get notificationsFilled => 'assets/svg/notifications_filled.svg';

  /// File path: assets/svg/notify.svg
  String get notify => 'assets/svg/notify.svg';

  /// File path: assets/svg/partner.svg
  String get partner => 'assets/svg/partner.svg';

  /// File path: assets/svg/profile-add.svg
  String get profileAdd => 'assets/svg/profile-add.svg';

  /// File path: assets/svg/profile.svg
  String get profile => 'assets/svg/profile.svg';

  /// File path: assets/svg/profile_filled.svg
  String get profileFilled => 'assets/svg/profile_filled.svg';

  /// File path: assets/svg/qr.svg
  String get qr => 'assets/svg/qr.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';

  /// File path: assets/svg/service.svg
  String get service => 'assets/svg/service.svg';

  /// File path: assets/svg/service_filled.svg
  String get serviceFilled => 'assets/svg/service_filled.svg';

  /// File path: assets/svg/terms.svg
  String get terms => 'assets/svg/terms.svg';

  /// File path: assets/svg/user.svg
  String get user => 'assets/svg/user.svg';

  /// File path: assets/svg/whatsapp.svg
  String get whatsapp => 'assets/svg/whatsapp.svg';

  /// File path: assets/svg/youtube.svg
  String get youtube => 'assets/svg/youtube.svg';

  /// List of all assets
  List<String> get values => [
        arrow,
        back,
        branch,
        camera,
        client,
        desc,
        edit,
        gallery,
        home,
        homeFilled,
        info,
        lang,
        lock,
        logo,
        logout,
        mode,
        notifications,
        notificationsFilled,
        notify,
        partner,
        profileAdd,
        profile,
        profileFilled,
        qr,
        search,
        service,
        serviceFilled,
        terms,
        user,
        whatsapp,
        youtube
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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

//适配类
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:screen_adaptive/src/config_spec.dart';

class ScreenAdapter {
  static final ScreenAdapter _instance = ScreenAdapter._internal();
  late ConfigSpec _spec;
  late MediaQueryData _mediaQuery;

  factory ScreenAdapter() => _instance;
  bool isInit = false;
  //初始化配置
  void init(BuildContext context, ConfigSpec spec) {
    _spec = spec;
    _mediaQuery = MediaQuery.of(context);
  }

  //宽高缩放比
  double get _widthRatio => _mediaQuery.size.width / _spec.designWidth;

  double get _heightRatio => _mediaQuery.size.height / _spec.designHeight;

  //字体缩放比
  double get _textScaleFactor => _mediaQuery.textScaler.scale(1);

  //safe area
  /// 安全区域宽高
  double get safeWidth =>
      _mediaQuery.size.width -
      _mediaQuery.padding.left -
      _mediaQuery.padding.right;

  double get safeHeight =>
      _mediaQuery.size.height -
      _mediaQuery.padding.top -
      _mediaQuery.padding.bottom;

  //宽高适配
  double wp(double px) => px * _widthRatio;

  double hp(double px) => px * _heightRatio;

  double sp(double px, {double minScale = 0.5, double maxScale = 1.2}) {
    final baseSize = px * min(_widthRatio, _heightRatio);
    return baseSize.clamp(baseSize * minScale, baseSize * maxScale) *
        _textScaleFactor;
  }

  ScreenAdapter._internal();
}

import 'package:screen_adaptive/src/screen_adapter.dart';

///num 扩展
extension AdaptiveNumberExtension on num {
  /// 宽度适配扩展
  double get wp => ScreenAdapter().wp(toDouble());
  /// 高度适配扩展
  double get hp => ScreenAdapter().hp(toDouble());
  /// 字体适配扩展
  double get sp => ScreenAdapter().sp(toDouble());
}

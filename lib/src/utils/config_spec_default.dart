import 'package:screen_adaptive/screen_adaptive.dart';

sealed class DefaultConfigSpec {
  static ConfigSpec? _initConfigSpec;

  static ConfigSpec get defaultConfigSpec =>
      _initConfigSpec ?? ConfigSpec(720, 1080);

  static void setDefaultConfigSpec(double w, double h) {
    _initConfigSpec = ConfigSpec(w, h);
  }
}

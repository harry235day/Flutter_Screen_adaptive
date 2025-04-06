// ========== 设计稿配置提供者 ==========
import 'package:flutter/cupertino.dart';
import 'package:screen_adaptive/src/config_spec.dart';

 class DesignSpecProvider extends InheritedWidget {
  final ConfigSpec spec;

  DesignSpecProvider({super.key, required super.child, required this.spec});

  static DesignSpecProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DesignSpecProvider>();
  }


  @override
  bool updateShouldNotify(covariant DesignSpecProvider oldWidget) {
    return oldWidget.spec.designHeight != spec.designHeight ||
        oldWidget.spec.designWidth != spec.designWidth;
  }
}

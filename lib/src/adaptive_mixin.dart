import 'package:flutter/cupertino.dart';
import 'package:screen_adaptive/src/design_spec_provider.dart';
import 'package:screen_adaptive/src/screen_adapter.dart';
import 'package:screen_adaptive/src/utils/config_spec_default.dart';

mixin AdaptiveMixin<T extends StatefulWidget> on State<T> {
  ScreenAdapter get adapter => ScreenAdapter();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateAdapter();
  }

  void _updateAdapter() {
    final spec =
        context
            .dependOnInheritedWidgetOfExactType<DesignSpecProvider>()
            ?.spec ??
        DefaultConfigSpec.defaultConfigSpec;
    adapter.init(context, spec);
  }

  double wp(double px) => adapter.wp(px);

  double hp(double px) => adapter.hp(px);

  double sp(double px) => adapter.sp(px);
}

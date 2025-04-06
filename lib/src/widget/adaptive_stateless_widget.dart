import 'package:flutter/cupertino.dart';
import 'package:screen_adaptive/screen_adaptive.dart';
import 'package:screen_adaptive/src/screen_adapter.dart';
import 'package:screen_adaptive/src/utils/config_spec_default.dart';

abstract class AdaptiveStatelessWidget extends StatelessWidget {
  const AdaptiveStatelessWidget({super.key});

  ScreenAdapter get adapter => ScreenAdapter();

  double wp(double px) => adapter.wp(px);

  double hp(double px) => adapter.hp(px);

  double sp(double px) => adapter.sp(px);


  @override
  Widget build(BuildContext context) {
    adapter.init(
      context,
      DesignSpecProvider.of(context)?.spec ??
          DefaultConfigSpec.defaultConfigSpec,
    );
    return buildWidget(context);
  }

  Widget buildWidget(BuildContext context);
}

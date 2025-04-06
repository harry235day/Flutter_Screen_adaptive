import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_adaptive/screen_adaptive.dart';

void main() {
  runApp(DesignSpecProvider(
      spec: ConfigSpec(720, 1080),
      child: MaterialApp(
        home: AdaptivePage(),
      )));
}


class AdaptivePage extends AdaptiveStatelessWidget {
  AdaptivePage({super.key});

  bool isLandScape = false;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60.hp),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.wp),
          color: Colors.green,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "屏幕适配",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          isLandScape = orientation == Orientation.landscape;
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        color: Colors.lightGreen,
                        alignment: Alignment.center,
                        width: 360.wp,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 120.wp,
                              color: Colors.black.withAlpha(100),
                              child: const Text(
                                "1-1",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 120.wp,
                              color: Colors.cyan.withAlpha(100),
                              child: const Text(
                                "1-2",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        alignment: Alignment.center,
                        width: 360.wp,
                        height: 485.hp,
                        child: const Text(
                          "2: 360.wp",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50.hp,
                  child: Text(
                    "StatefulWidget适配",
                    style: TextStyle(color: Colors.black54, fontSize: 20.sp),
                  ),
                ),
                Expanded(child: const AdaptiveStatefulWidget()),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.green,
        onPressed: () {
          if (isLandScape) {
            portraitUp();
          } else {
            landscape();
          }
        },
        child: Icon(
          Icons.screen_rotation,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AdaptiveStatefulWidget extends StatefulWidget {
  const AdaptiveStatefulWidget({super.key});

  @override
  State<AdaptiveStatefulWidget> createState() => _AdaptiveStatefulWidgetState();
}

class _AdaptiveStatefulWidgetState extends State<AdaptiveStatefulWidget>
    with AdaptiveMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.redAccent,
          alignment: Alignment.center,
          width: 360.wp,
          height: 485.hp,
          child: const Text(
            "3: 360.wp",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          width: 360.wp,
          height: 485.hp,
          child: const Text(
            "4: 360.wp",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

void portraitUp() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

void landscape() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

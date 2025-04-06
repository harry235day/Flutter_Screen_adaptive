多维度适配体系：

横向适配（wp）

纵向适配（hp）

字体综合适配（sp）

安全区域适配（safeWidth/safeHeight）

扩展体系完整：

`AdaptiveStatelessWidget：`无状态组件基类

`AdaptiveStatefulWidget + AdaptiveState：`有状态组件体系

`AdaptiveMixin：`适配能力混入

数值扩展方法（.wp/.hp/.sp）

系统字体缩放处理：

```
double sp(double px, {double minScale = 0.8, double maxScale = 1.2}) {
    final baseSize = px * min(_widthRatio, _heightRatio);
    return baseSize.clamp(
        baseSize * minScale,
        baseSize * maxScale
    ) * _textScaleFactor;
}
```
设计稿配置灵活：

```
DesignSpecProvider(
spec: const DesignSpec(designWidth: 720, designHeight: 1080),
child: const MyApp(),
)
```
性能优化：

单例模式管理适配逻辑

InheritedWidget 实现配置更新

自动尺寸缓存

开发者使用方式：
初始化配置：

```
void main() {
    runApp(
        DesignSpecProvider(spec: const DesignSpec(designWidth: 720, designHeight: 1080),
        child: const MyApp(),),
    );
}
```
### 三种使用方式任选：

方式1：扩展方法（推荐）
- 360.wp
- 200.hp
- 28.sp

###  方式2：继承基类
```
class MyWidget extends AdaptiveStatelessWidget {
@override
Widget build(BuildContext context) {
    return Container(width: wp(360),height: hp(200),
    child: Text('Text', style: TextStyle(fontSize: sp(28))),);
    }
}
```

### 方式3：使用 Mixin
```
class _MyWidgetState extends State<MyWidget> with AdaptiveMixin {
@override
Widget build(BuildContext context) {
    return Container(width: wp(360),height: hp(200),
        child: Text('Text', style: TextStyle(fontSize: sp(28))),);
    }
}
```
动态响应变化：

```
@override
void didChangeDependencies() {
super.didChangeDependencies();
// 自动响应设计稿配置变化
_updateAdapter();
}
```
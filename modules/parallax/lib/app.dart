import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const background = 'background.png';

const activity = 'activity.png';

const bushPrimary = 'bush-primary.png';

const bushSecondary = 'bush-secondary.png';

const bushBg1 = 'bush-bg-1.png';

const bushBg2 = 'bush-bg-2.png';

const treeFade = 'tree-fade.png';

const treePrimary = 'tree-primary.png';

const green = 'green.png';

const assetsDirectory = 'assets';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ValueNotifier<double> opacity;
  late ValueNotifier<double> bg1;
  late ValueNotifier<double> bg2;
  late ValueNotifier<double> bg3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    opacity = ValueNotifier(0);
    bg1 = ValueNotifier(0);
    bg2 = ValueNotifier(0);
    bg3 = ValueNotifier(0);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      bg1.value = defaultBg1;
      bg2.value = defaultBg2;
      bg3.value = defaultBg3;
    });
  }

  double get defaultBg1 => context.height / 2.5;
  double get defaultBg2 => context.height / 4.6;
  double get defaultBg3 => context.height / 2.2;

  @override
  Widget build(BuildContext context) {
    // if (_scrollController.positions.isEmpty) {
    //   return SizedBox();
    // }
    return NotificationListener<ScrollUpdateNotification>(
        onNotification: (scroll) {
          final double maxScroll = scroll.metrics.maxScrollExtent;
          final double currentScroll = scroll.metrics.pixels;

          final double deltaScroll = currentScroll / maxScroll;
          final double deltaScrollOpposite = ((deltaScroll - 1) * -1);

          final double newOpacity = (deltaScroll).clamp(0, 1);

          final double bg1Pixel =
              defaultBg1 / deltaScrollOpposite.clamp(.78, 1);

          final double bg2Pixel =
              defaultBg2 / deltaScrollOpposite.clamp(.7, .8).clamp(.0001, 1);

          final double bg3Pixel =
              defaultBg3 / deltaScrollOpposite.clamp(.64, 1);

          opacity.value = newOpacity;
          bg1.value = bg1Pixel;
          bg2.value = bg2Pixel;
          bg3.value = bg3Pixel;

          return true;
        },
        child: Stack(
          children: [
            ParallaxImage(
              assetPath: background,
              width: context.width + 200,
              initialTopPosition: 0,
            ),
            Positioned(
              top: context.height / 1.8,
              left: 0,
              child: SizedBox(
                width: context.width,
                height: context.height,
                child: Image.asset(
                  '$assetsDirectory/${green}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: bg2,
                builder: (context, double top, __) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 800),
                    top: top,
                    left: 0,
                    child: SizedBox(
                      width: context.width,
                      child: Image.asset(
                        '$assetsDirectory/${bushBg2}',
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }),
            ValueListenableBuilder(
                valueListenable: bg1,
                builder: (context, double top, __) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 800),
                    top: top,
                    left: 0,
                    child: SizedBox(
                      width: context.width * .88,
                      // height: widget.height,
                      child: Image.asset(
                        '$assetsDirectory/${bushBg1}',
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }),
            ValueListenableBuilder(
                valueListenable: bg3,
                builder: (context, double top, __) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 800),
                    top: top,
                    left: 0,
                    child: SizedBox(
                      width: context.width + 146,
                      // height: widget.height,
                      child: Image.asset(
                        '$assetsDirectory/${bushPrimary}',
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }),
            ValueListenableBuilder(
                valueListenable: bg3,
                builder: (context, double top, __) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 800),
                    top: top - 500,
                    left: 0,
                    child: SizedBox(
                      width: context.width * .4,
                      // height: widget.height,
                      child: Image.asset(
                        '$assetsDirectory/${treePrimary}',
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }),
            ParallaxImage(
              assetPath: bushSecondary,
              width: context.width * .4,
              initialLeftPosition: 45,
              initialTopPosition: context.height * .8,
            ),
            ParallaxImage(
              assetPath: activity,
              width: context.width * .2,
              initialTopPosition: context.height * .6,
              initialLeftPosition: context.width * .2,
              builder: (context, child) {
                return ValueListenableBuilder(
                    valueListenable: opacity,
                    builder: (context, double val, _) {
                      return AnimatedOpacity(
                        opacity: val,
                        duration: Duration(milliseconds: 300),
                        child: child,
                      );
                    });
              },
            ),
            ParallaxImage(
              assetPath: treeFade,
              width: context.width * .2,
              initialTopPosition: 0,
              initialLeftPosition: context.width - context.width * .2,
              builder: (context, child) {
                return ValueListenableBuilder(
                    valueListenable: opacity,
                    builder: (context, double val, _) {
                      return AnimatedOpacity(
                        opacity: val,
                        duration: Duration(milliseconds: 300),
                        child: child,
                      );
                    });
              },
            ),
            Center(
              child: ValueListenableBuilder(
                  valueListenable: opacity,
                  builder: (context, double val, _) {
                    return AnimatedOpacity(
                      opacity: val,
                      duration: Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          Text('Help The Environment'),
                          Text('Plant A Tree'),
                        ],
                      ),
                    );
                  }),
            ),
            ListView(
              children: const [
                SizedBox(height: 2500),
              ],
            )
          ],
        ));
  }
}

class ParallaxImage extends StatefulWidget {
  const ParallaxImage({
    Key? key,
    required this.assetPath,
    this.initialTopPosition = 0,
    this.initialLeftPosition = 0,
    this.width,
    this.builder,
  }) : super(key: key);

  final String assetPath;
  final double initialTopPosition;
  final double initialLeftPosition;
  final double? width;
  final Widget Function(BuildContext, Widget)? builder;
  // final BoxFit fit;

  @override
  State<ParallaxImage> createState() => _ParallaxImageState();
}

class _ParallaxImageState extends State<ParallaxImage> {
  late double top;
  late double left;

  @override
  void initState() {
    top = widget.initialTopPosition;
    left = widget.initialLeftPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      width: widget.width,
      // height: widget.height,
      child: Image.asset(
        '$assetsDirectory/${widget.assetPath}',
        fit: BoxFit.contain,
      ),
    );

    return AnimatedPositioned(
      duration: Duration(milliseconds: 800),
      top: top,
      left: left,
      child:
          widget.builder == null ? child : widget.builder!.call(context, child),
    );
  }
}

extension SizeContext on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

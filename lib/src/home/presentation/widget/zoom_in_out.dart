import 'package:flutter/material.dart';

class ZoomInOutWidget extends StatefulWidget {
  const ZoomInOutWidget({super.key, required this.child});

  final Widget child;
  // final Duration duration;
  // final Duration delay;
  // final Function(AnimationController)? controller;
  // final bool manualTrigger;
  // final bool animate;
  // final Function(AnimateDoDirection direction)? onFinish;
  // final double from;
  // final Curve curve;

  // ZoomIn({
  //   key,
  //   required this.child,
  //   this.duration = const Duration(milliseconds: 800),
  //   this.delay = const Duration(milliseconds: 0),
  //   this.controller,
  //   this.manualTrigger = false,
  //   this.animate = true,
  //   this.from = 1.0,
  //   this.onFinish,
  //   this.curve = Curves.easeInOutCubicEmphasized,
  // }) : super(key: key) {
  //   if (manualTrigger == true && controller == null) {
  //     throw FlutterError('If you want to use manualTrigger:true, \n\n'
  //         'Then you must provide the controller property, that is a callback like:\n\n'
  //         ' ( controller: AnimationController) => yourController = controller \n\n');
  //   }
  // }

  @override
  State createState() => ZoomInOutState();
}

/// State class, where the magic happens
class ZoomInOutState extends State<ZoomInOutWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> zoom;
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void dispose() {
    // disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    zoom = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        curve: Curves.easeInOutCubicEmphasized,
        parent: controller,
      ),
    );

    opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25),
      ),
    );

    controller.forward();

    controller.addStatusListener((AnimationStatus status) {
      switch (status) {
        case AnimationStatus.completed:
          controller.reverse();
          break;
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: zoom.value,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: opacity.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

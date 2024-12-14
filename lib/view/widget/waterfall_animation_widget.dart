import 'package:flutter/material.dart';

class WaterfallAnimationWidget extends StatefulWidget {
  const WaterfallAnimationWidget({
    super.key,
    required this.children,
    required this.duration,
    this.delay = const Duration(milliseconds: 100),
  });

  final List<Widget> children;
  final Duration duration;
  final Duration delay;
  

  @override
  State<WaterfallAnimationWidget> createState() => WaterfallAnimationWidgetState();
}

class WaterfallAnimationWidgetState extends State<WaterfallAnimationWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final intervalStep = 1.0 / widget.children.length;
    _animations = List.generate(widget.children.length, (index) {
      return Tween<double>(begin: -50.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * intervalStep,
            (index + 1) * intervalStep,
            curve: Curves.easeOut,
          ),
        ),
      );
    });
  }

  void playAnimation() {
    _controller.forward();
  }

  void resetAnimation() {
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.children.length, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            bool isAnimationInProgress = _controller.isAnimating || _controller.isCompleted;

            // return Transform.translate(
            //   offset: Offset(0, _animations[index].value),
            //   child: Opacity(
            //     opacity: (_animations[index].value == 0) ? 1.0 : 0.0,
            //     child: child,
            //   ),
            // );

            return Transform.translate(
              offset: Offset(0, isAnimationInProgress ? _animations[index].value : 0),
              child: Opacity(
                opacity: isAnimationInProgress ? (_animations[index].value == 0 ? 1.0 : 0.05) : 0,
                child: child,
              ),
            );
          },
          child: widget.children[index],
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

class FloatingUpDownWidget extends StatefulWidget {
  const FloatingUpDownWidget({super.key, required this.child, required this.offset, required this.duration});

  final Widget child;
  final double offset;
  final Duration duration;

  @override
  State<FloatingUpDownWidget> createState() => _FloatingUpDownWidgetState();
}

class _FloatingUpDownWidgetState extends State<FloatingUpDownWidget> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.offset,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
}
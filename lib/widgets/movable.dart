import 'package:flutter/material.dart';


/// This is the stateful widget that the main application instantiates.
class Movable extends StatefulWidget {
  final Offset beginOffset;
  final Offset endOffset;//https://youtu.be/SqQIvR0N3lk?list=PLvkCPIjCFSmv2sBKQX1dXgBrzCxYQ6YcN&t=820
  final Curve effect;
  final Duration duration;
  final Widget child;
  
  const Movable({Key? key, this.beginOffset = Offset.zero, required this.endOffset, required this.effect, required this.duration, required this.child}) : super(key: key);

  @override
  State<Movable> createState() => _MovableState();
}

/// This is the private State class that goes with MovableStatefulWidget.
class _MovableState extends State<Movable>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: widget.beginOffset,
    end: widget.endOffset,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: widget.effect,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}
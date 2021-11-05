
import 'package:flutter/material.dart';


class FadeAnimation extends StatefulWidget {
  final double width;
  final int time;
  final Widget childs;
  FadeAnimation( this.time, this.childs, this.width);

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: widget.time));
    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _animationController!, curve: Curves.fastOutSlowIn),
    );
    _animationController!.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.translationValues(0.0, _animation!.value * widget.width,  0.0),
          child: widget.childs,
        );
      },
    );
  }
}



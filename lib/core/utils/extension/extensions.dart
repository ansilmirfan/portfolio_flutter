import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/widgets/slide_widget.dart';

extension Propotion on double {
  double multiply(double factor) => this * factor;
}

//extension on BuildContext for naviagation Purposes
extension Navigation on BuildContext {
  void pop() => Navigator.of(this).pop();
  void push(Widget page) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  //navigation with transoerent bakcground
  void pushTransperent(Widget page) => Navigator.of(this).push(
    PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 600),
      reverseTransitionDuration: Duration(milliseconds: 600),
      barrierColor: Colors.black45,

      pageBuilder: (context, animation, secondaryAnimation) {
        final slideTransition = Tween(
          begin: Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);
        return Opacity(
          opacity: animation.value,
          child: SlideTransition(position: slideTransition, child: page),
        );
      },
    ),
  );
}

//extension on widget for animation
extension SlideAnimation on Widget {
  //animate to left from right
  Widget slideToLeft({int delay = 0}) =>
      SlideWidget(slide: Slide.toLeft, delay: delay, child: this);
  //animate to right from left
  Widget slideToRight({int delay = 0}) =>
      SlideWidget(slide: Slide.toRight, delay: delay, child: this);
}

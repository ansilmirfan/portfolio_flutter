import 'package:flutter/material.dart';

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
      transitionDuration: Duration(milliseconds: 400),
      reverseTransitionDuration: Duration(milliseconds: 400),
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

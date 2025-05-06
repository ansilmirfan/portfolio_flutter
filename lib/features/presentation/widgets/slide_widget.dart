import 'package:flutter/material.dart';

enum Slide { toTop, toLeft, toRight, toBottom }

class SlideWidget extends StatefulWidget {
  final Slide slide;
  final Widget child;
  final int delay;
  final Duration duration;

  const SlideWidget({
    super.key,
    required this.slide,
    required this.child,
    this.delay = 0,
    this.duration = const Duration(milliseconds: 900),
  });

  @override
  SlideWidgetState createState() => SlideWidgetState();
}

class SlideWidgetState extends State<SlideWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: const Duration(milliseconds: 400),
    );

    final beginOffset = _getBeginOffset(widget.slide);

    _offsetAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    // Start the animation after the specified delay
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (_controller.status != AnimationStatus.completed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _getBeginOffset(Slide direction) {
    switch (direction) {
      case Slide.toTop:
        return const Offset(0, 1);
      case Slide.toBottom:
        return const Offset(0, -1);
      case Slide.toLeft:
        return const Offset(1, 0);
      case Slide.toRight:
        return const Offset(-1, 0);
    }
  }

  Future reverse() async {
    if (mounted) {
      await _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(position: _offsetAnimation, child: widget.child),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

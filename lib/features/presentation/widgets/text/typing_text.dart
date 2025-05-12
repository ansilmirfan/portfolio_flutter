import 'dart:async';

import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  final String text;
  const TypingText({super.key, required this.text});

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _cursorController;
  //length of the string
  int _visibleChars = 12;
  //start animating from reverse
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();

    // Cursor blinking animation
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    Future.delayed(Duration(seconds: 3)).then((value) {
      startTyping();
    });
  }

  void startTyping() {
    const typeDuration = Duration(milliseconds: 100);
    const pauseDuration = Duration(seconds: 2);

    _timer = Timer.periodic(typeDuration, (timer) {
      setState(() {
        if (_isTyping) {
          _visibleChars++;
          if (_visibleChars >= widget.text.length) {
            _isTyping = false;
            timer.cancel();
            Future.delayed(pauseDuration, startTyping);
          }
        } else {
          _visibleChars--;
          if (_visibleChars <= 0) {
            _isTyping = true;
            timer.cancel();
            Future.delayed(pauseDuration, startTyping);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(
      context,
    ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w300);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.text.substring(0, _visibleChars),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        FadeTransition(
          opacity: _cursorController,
          child: Text('|', style: style),
        ),
      ],
    );
  }
}

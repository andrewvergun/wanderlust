import 'package:flutter/material.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';

class BlurTextAnimation extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;

  const BlurTextAnimation({
    Key? key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 400),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurText(
      text: text,
      textStyle: style,
      duration: duration,
      type: AnimationType.word,
    );
  }
}

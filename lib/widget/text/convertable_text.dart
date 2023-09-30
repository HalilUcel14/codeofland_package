import 'package:flutter/material.dart';

class ConvertableText extends StatelessWidget {
  const ConvertableText({
    super.key,
    required this.text,
    this.color,
    required this.style,
    this.textAlign,
    this.gradientColor,
    this.shadows,
  }) : assert(
          gradientColor == null || color == null,
          "You can't use both color and gradientColor at the same time.",
        );

  final String text;
  final Color? color;
  final TextStyle style;
  final TextAlign? textAlign;
  final LinearGradient? gradientColor;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    Paint? foreground;
    if (gradientColor != null) {
      foreground = Paint()
        ..shader = gradientColor!.createShader(
          const Rect.fromLTWH(0, 0, 200, 70),
        );
    }

    return Text(
      text,
      style: style.copyWith(
        color: foreground == null ? color : null,
        foreground: foreground,
        shadows: shadows,
      ),
      textAlign: textAlign,
    );
  }
}

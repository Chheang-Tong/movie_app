import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle textStyle;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 4,
    required this.textStyle,
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textStyle = widget.textStyle;
        final textSpan = TextSpan(text: widget.text, style: textStyle);
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(
            maxWidth: constraints.maxWidth,
          );

        final isOverflowing = textPainter.didExceedMaxLines;

        return RichText(
          text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(
                text: isExpanded
                    ? widget.text // Show full text when expanded
                    : _truncateText(
                        widget.text,
                        constraints.maxWidth,
                        textStyle,
                      ),
              ),
              if (isOverflowing)
                TextSpan(
                  text: isExpanded ? " Read Less" : " Read More",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                ),
            ],
          ),
        );
      },
    );
  }

  String _truncateText(String text, double maxWidth, TextStyle textStyle) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    int lastIndex = text.length;

    while (textPainter.didExceedMaxLines) {
      lastIndex -= 2;
      textPainter.text = TextSpan(
          text: "${text.substring(0, lastIndex)}...", style: textStyle);
      textPainter.layout(maxWidth: maxWidth);
    }

    // Concatenate the "Read More" with the truncated text, ensuring it stays in the same line
    return "${text.substring(0, lastIndex)} ...";
  }
}

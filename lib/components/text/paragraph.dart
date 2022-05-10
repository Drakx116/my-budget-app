import 'package:flutter/material.dart';

class WidgetParagraph extends StatelessWidget {
  final String text;

  const WidgetParagraph({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(text,
        style: const TextStyle(fontSize: 16)
      )
    );
  }
}

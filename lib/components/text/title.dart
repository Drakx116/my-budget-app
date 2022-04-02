import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget
{
  final String text;

  const WidgetTitle({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24
        )
      )
    );
  }
}
import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget
{
  final String text;
  final int padding;

  const WidgetTitle({ Key? key, required this.text, this.padding = 16 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: double.parse(padding.toString())),
      child: Text(text,
        style: const TextStyle(
          fontFamily: 'Metropolis Bold',
          fontSize: 26
        )
      )
    );
  }
}
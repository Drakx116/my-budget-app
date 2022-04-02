import 'package:flutter/material.dart';

class ExtendedDivider extends StatelessWidget
{
  final bool orDivider;
  final int padding;

  const ExtendedDivider({
    Key? key,
    required this.orDivider,
    required this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> separator = [
      const Expanded(child: Divider())
    ];

    if (orDivider) {
      separator.add(const Text('     OU     '));
      separator.add(const Expanded(child: Divider()));
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding.toDouble()),
      child: SizedBox(
        width: 360,
        child:Row(
          children: separator
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AlignedTuple extends StatelessWidget
{
  final String label;
  final String value;

  const AlignedTuple({ Key? key, required this.label, required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Expanded(flex: 2,
          child: Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
          )
        ),
        Expanded(flex: 4,
          child: Text(value,
            style: const TextStyle(fontSize: 16)
          )
        )
      ]),
    );
  }
}
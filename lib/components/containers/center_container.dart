import 'package:flutter/material.dart';

class CenterContainer extends StatelessWidget
{
  final List<Widget> widgets;

  const CenterContainer({ Key? key, required this.widgets }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
          ),
        ),
      ),
    ));
  }
}
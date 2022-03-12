import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget
{
  final List<Widget> widgets;

  const BaseContainer({ Key? key, required this.widgets }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgets,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
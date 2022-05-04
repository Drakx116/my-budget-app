import 'package:flutter/material.dart';

class IncomeScreen extends StatelessWidget
{
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une rentrée'),
        centerTitle: true,
        elevation: 0,

      ),
      body: const Text('Créditer'),
    );
  }
}
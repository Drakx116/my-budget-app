import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget
{
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une dépense'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Text('Dépenser'),
    );
  }
}
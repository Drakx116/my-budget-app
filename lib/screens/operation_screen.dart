import 'package:flutter/material.dart';
import 'package:my_budget_app/constants/enums/operation_type.dart';

class OperationScreen extends StatelessWidget
{
  final OperationType type;
  dynamic amount;

  OperationScreen({ Key? key, required this.type, this.amount = 0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrer une opération'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text('Operation Type : ' + type.value),
          Text('Operation Amount : ' + amount.toString()),
        ]),
      ),
    );
  }
}
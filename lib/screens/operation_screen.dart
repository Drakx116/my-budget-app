import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_budget_app/components/containers/base_container.dart';
import 'package:my_budget_app/constants/enums/operation_type.dart';
import 'package:my_budget_app/constants/enums/payment_method_enum.dart';

class OperationScreen extends StatefulWidget
{
  OperationType type;
  late PaymentMethodType paymentMethod;
  late String price;
  late String label = '';

  bool isOperationComplete() {
    if (price.isEmpty) price = '0';

    return label.isNotEmpty && double.parse(price.toString()) > 0;
  }

  OperationScreen({Key? key, required this.type, String? amount }) : super(key: key) {
    price = amount ?? '0';
    paymentMethod = PaymentMethodType.creditCard;
  }

  @override
  State<OperationScreen> createState() => _OperationScreenState();
}

class _OperationScreenState extends State<OperationScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _priceController
      ..text = (widget.price)
      ..selection = TextSelection.fromPosition(TextPosition(offset: _priceController.text.length));

    _labelController.text = widget.label;

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Enregistrer une opération'),
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: GestureDetector(
                  child: const Text('Accueil'),
                  onTap: () { Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BaseContainer())
                  );},
                )
              ),
            ];
          })
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Nouvelle opération')
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              child: Column(
                children: [
                  DropdownButton(
                    isExpanded: true,
                    value: widget.type.value,
                    onChanged: (type) {
                      setState(() { widget.type = widget.type.from(type.toString()); });
                    },
                    items: OperationType.values.map((OperationType type) => DropdownMenuItem(child: Text(type.value), value: type.value)).toList(),
                  ),
                  const SizedBox(height: 16),
                  DropdownButton(
                    isExpanded: true,
                    value: widget.paymentMethod.value,
                    onChanged: (type) {
                      setState(() { widget.paymentMethod = widget.paymentMethod.from(type.toString()); });
                    },
                    items: PaymentMethodType.values.map((PaymentMethodType type) => DropdownMenuItem(child: Text(type.value), value: type.value)).toList(),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'Montant de la dépense',
                      suffixIcon: Icon(Icons.euro)
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    onChanged: (price) {
                      setState(() { widget.price = price; });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Libellé'),
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (value) {
                      setState(() { widget.label = value; });
                    },
                  ),
                  const SizedBox(height: 16),
                  (widget.isOperationComplete()) ? ElevatedButton(onPressed: () {}, child: const Text('Enregistrer')) : Container()
                ]
              )
            ),
          )
        ]
      ),
    );
  }
}
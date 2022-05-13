import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_budget_app/components/containers/base_container.dart';
import 'package:my_budget_app/components/snackbar.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/constants/enums/operation_type.dart';
import 'package:my_budget_app/constants/enums/payment_method_enum.dart';
import 'package:my_budget_app/constants/snackbar_status_constants.dart' as level;
import 'package:my_budget_app/models/api/requests/user_operation.dart';
import 'package:my_budget_app/services/api_service.dart';
import 'package:provider/provider.dart';

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
            child: WidgetTitle(text: 'Nouvelle opération', padding: 0)
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
                  (widget.isOperationComplete()) ? ElevatedButton(onPressed: () async {
                    var api = context.read<APIService>.call();

                    UserOperationModel operation = UserOperationModel(
                      type: widget.type.name,
                      method: widget.paymentMethod.name,
                      amount: double.parse(widget.price).toStringAsFixed(2),
                      label: widget.label
                    );

                    try {
                      await api.createOperation(operation);
                    } catch (e) {
                      const ExtendedSnackBar(
                        content: 'L\'opération n\'a pas pu être enregistrée. Veuillez réessayer ultérieurement.',
                        status: level.ERROR,
                      ).show(context);

                      return;
                    }

                    ExtendedSnackBar(
                      content: 'Une ${widget.type.value} de ${double.parse(widget.price).toStringAsFixed(2)}€ a bien été enregistrée.',
                      status: level.SUCCESS,
                    ).show(context);

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const BaseContainer()),
                    );
                  }, child: const Text('Enregistrer')) : Container()
                ]
              )
            ),
          )
        ]
      ),
    );
  }
}
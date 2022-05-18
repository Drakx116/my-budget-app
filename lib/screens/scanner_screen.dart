import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:my_budget_app/components/text/divider.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/constants/enums/operation_type.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/screens/operation_screen.dart';
import 'package:my_budget_app/widgets/scanner_widget.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key? key, this.price }) : super(key: key);

  String? price;

  bool isPriceSet() {
    var price = this.price;

    if (price == null) return false;
    if (price.isEmpty) return false;

    return price != '0';
  }

  @override
  State<StatefulWidget> createState() {
    return _ScannerScreenState();
  }
}

class _ScannerScreenState extends State<ScannerScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller
      ..text = (widget.price != null ? widget.price.toString() : '')
      ..selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.PRIMARY,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: WidgetTitle(text: 'Choix du montant'),
              )
            ]),
            ScannerWidget(
              onImage: (InputImage image) async {
                TextRecognition textRecognition = TextRecognition();
                RecognizedText? result = await textRecognition.process(image);

                for (var element in result!.blocks) {
                  if (RegExp(r'^[0-9]+([.,][0-9]{2})?[ ]?(EUR|Eur|eur|e|€|E)').hasMatch(element.text)) {
                    setState(() {
                      widget.price = element.text
                        .replaceAll('EUR', '')
                        .replaceAll('Eur', '')
                        .replaceAll('eur', '')
                        .replaceAll('e', '')
                        .replaceAll('€', '')
                        .replaceAll('E', '')
                        .replaceAll(',', '.')
                        .trim();
                    });
                  }
                }
              },
              parent: this, // TODO : Avoid doing this
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const ExtendedDivider(orDivider: false, padding: 16)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'Montant de la dépense',
                      labelStyle: TextStyle(color: AppColor.PRIMARY),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    onChanged: (price) { setState(() { widget.price = price; }); },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: (widget.isPriceSet()) ? ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  OperationScreen(type: OperationType.expense, amount: widget.price)
                ));
              }, child: const Text('Suivant')) : Container(),
            )
          ],
        ),
      ),
    );
  }
}

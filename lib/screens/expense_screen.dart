import 'package:flutter/material.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:my_budget_app/widgets/scanner_widget.dart';

class ExpenseScreen extends StatefulWidget {
  ExpenseScreen({Key? key, this.price }) : super(key: key);

  String? price;

  @override
  State<StatefulWidget> createState() {
    return _ExpenseScreenState();
  }
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une dépense'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
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
                        .replaceAll('E', '');
                  });
                }
              }
            },
            parent: this, // TODO : Avoid doing this
          ),
          const SizedBox(height: 32),
          Text('Total actuel : ' + (widget.price != null ? widget.price.toString() : '0') + '€')
        ],
      ),
    );
  }
}

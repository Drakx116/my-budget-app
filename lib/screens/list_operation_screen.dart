import 'package:flutter/cupertino.dart';
import 'package:my_budget_app/components/text/title.dart';

class OperationListScreen extends StatelessWidget
{
  const OperationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      WidgetTitle(text: 'Mes opérations', padding: 0)
    ]);
  }
}

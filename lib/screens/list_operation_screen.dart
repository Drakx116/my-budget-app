import 'package:flutter/cupertino.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/widgets/operations/operation_list_view.dart';

class OperationListScreen extends StatelessWidget
{
  const OperationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        WidgetTitle(text: 'Mes opérations'),
        OperationListWidget()
      ]
    );
  }
}

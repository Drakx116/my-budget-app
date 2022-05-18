import 'package:flutter/material.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/widgets/operations/operation_list_view.dart';

class OperationListScreen extends StatefulWidget
{
  const OperationListScreen({Key? key,}) : super(key: key);

  @override
  State<OperationListScreen> createState() => _OperationListScreenState();
}

class _OperationListScreenState extends State<OperationListScreen> {
  String _type = 'all';

  _filterUpdate(String? value) {
    setState(() {
      _type = value ?? 'all';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WidgetTitle(text: 'Mes opérations'),
        Row(
          children: [
            Expanded(child: Row(
              children: [
                Radio(
                  value: 'all',
                  groupValue: _type,
                  onChanged: (value) {
                    _filterUpdate(value?.toString());
                  },
                ),
                const Text('Toutes')
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            )),
            Expanded(child: Row(
              children: [
                Radio(
                    value: 'income',
                    groupValue: _type,
                    onChanged: (value) {
                      _filterUpdate(value?.toString());
                    }
                ),
                const Text('Rentrées')
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            )),
            Expanded(child: Row(
                children: [
                Radio(
                  value: 'expense',
                  groupValue: _type,
                  onChanged: (value) {
                    _filterUpdate(value?.toString());
                  }
                ),
                const Text('Dépenses')
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ))
          ],
        ),
        OperationListWidget(type: _type)
      ]
    );
  }
}

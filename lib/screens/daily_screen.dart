import 'package:flutter/cupertino.dart';
import 'package:my_budget_app/components/text/title.dart';

class DailyScreen extends StatelessWidget
{
  const DailyScreen
({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        WidgetTitle(text: 'Mon quotidien')
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_budget_app/components/text/title.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        WidgetTitle(text: 'Mon budget', padding: 0),
      ],
    );
  }
}
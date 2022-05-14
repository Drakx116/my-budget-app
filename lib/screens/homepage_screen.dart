import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/base_container.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/screens/list_operation_screen.dart';
import 'package:my_budget_app/widgets/operations/operation_list_view.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(children: const [
          WidgetTitle(text: 'Mon budget', padding: 0),
        ]),
        const SizedBox(height: 32),
        Row(children: const [
          WidgetTitle(text: 'Mes dernières opérations', padding: 0),
        ]),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: OperationListWidget(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BaseContainer(givenIndex: 1)));
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Toutes mes opérations', style: TextStyle(color: AppColor.LIGHT, fontSize: 16)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.PRIMARY),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                )
              )
            ),
          ],
        )
      ],
    );
  }
}
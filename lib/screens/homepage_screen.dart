import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/base_container.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/widgets/operations/operation_list_view.dart';
import 'package:my_budget_app/widgets/operations/operations_summary_widget.dart';
import 'package:my_budget_app/widgets/single_value_tile.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(children: const [
          WidgetTitle(text: 'Mon budget'),
        ]),
        const OperationSummaryWidget(),
        Row(children: const [
          WidgetTitle(text: 'Mes dernières opérations'),
        ]),
        const Padding(
          padding: EdgeInsets.only(top:8, bottom: 16),
          child: OperationListWidget(limit: 5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BaseContainer(givenIndex: 1)));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text('Voir tout', style: TextStyle(color: AppColor.LIGHT, fontSize: 16)),
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
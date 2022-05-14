import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/base_container.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/widgets/operations/operation_list_view.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: SingleValueTile(
                    label: 'Total des rentrées',
                    value: '121.69€',
                    backgroundColor: AppColor.QUATERNARY,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: SingleValueTile(
                    label: 'Total des dépenses',
                    value: '96.64€',
                    backgroundColor: AppColor.SECONDARY,
                  ),
                ),
              )
            ],
          ),
        ),
        Row(children: const [
          WidgetTitle(text: 'Mes dernières opérations'),
        ]),
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
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
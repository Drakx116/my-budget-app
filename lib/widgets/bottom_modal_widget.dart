import 'package:flutter/material.dart';
import 'package:my_budget_app/components/text/paragraph.dart';
import 'package:my_budget_app/constants/enums/operation_type.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/screens/operation_screen.dart';

class BottomModal extends StatelessWidget
{
  const BottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WidgetParagraph(text: 'Actions rapides'),
                  TextButton(
                    onPressed: () { Navigator.pop(context); },
                    child: const Text('Fermer', style: TextStyle(color: AppColor.DARK)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.QUATERNARY
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text('Créditer', style: TextStyle(
                                  color: AppColor.QUATERNARY,
                                  fontSize: 18
                                ))
                              ],
                            )
                          ),
                          onTap: () {
                            Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => OperationScreen(type: OperationType.income))
                            );
                          },
                        ),
                      )
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.SECONDARY
                              )
                            ),
                            child: const Text('Dépenser', style: TextStyle(
                              color: AppColor.SECONDARY,
                              fontSize: 18
                            ))
                          ),
                          onTap: () {
                            Navigator.popAndPushNamed(context, 'expense');
                          },
                        ),
                      )
                    )
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}
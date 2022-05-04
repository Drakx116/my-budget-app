import 'package:flutter/material.dart';
import 'package:my_budget_app/screens/income_screen.dart';

class BottomModal extends StatelessWidget
{
  const BottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Actions rapides'),
                  ElevatedButton(
                    onPressed: () { Navigator.pop(context); },
                    child: const Text('Fermer')
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          child: Container(
                            // alignment: Alignment.center,
                            decoration: const BoxDecoration(color: Colors.blue),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text('Créditer', style: TextStyle(color: Colors.white))
                              ],
                            )
                          ),
                          onTap: () {
                            Navigator.popAndPushNamed(context, 'income');
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
                            decoration: const BoxDecoration(color: Colors.blue),
                            child: const Text('Dépenser', style: TextStyle(color: Colors.white))
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
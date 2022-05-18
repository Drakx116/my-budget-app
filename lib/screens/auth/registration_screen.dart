import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/center_container.dart';
import 'package:my_budget_app/components/text/divider.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/screens/auth/login_screen.dart';
import 'package:my_budget_app/utils/forms/registration_form.dart';

class RegistrationScreen extends StatelessWidget
{
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterContainer(widgets: [
      const WidgetTitle(text: 'Inscription'),
      const RegistrationForm(),
      const ExtendedDivider(orDivider: true, padding: 32),

      Column(
        children: [
          const Text('Déjà un compte ?', style: TextStyle(fontSize: 16)),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Se connecter'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 8, horizontal: 24))
              ),
            ),
          )
        ],
      )
    ]);
  }
}
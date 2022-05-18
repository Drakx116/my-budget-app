import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/center_container.dart';
import 'package:my_budget_app/components/text/divider.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/screens/auth/registration_screen.dart';
import 'package:my_budget_app/utils/forms/login_form.dart';

class LoginScreen extends StatelessWidget
{
  final String? givenEmail;

  const LoginScreen({Key? key, this.givenEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterContainer(widgets: [
      const WidgetTitle(text: 'Connexion'),
      LoginForm(givenEmail: givenEmail),
      const ExtendedDivider(orDivider: true, padding: 32),

      Column(
        children: [
          const Text('Pas encore de compte ?', style: TextStyle(fontSize: 16)),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                  );
                },
                child: const Text('S\'inscrire')
            ),
          )
        ],
      )
    ]);
  }
}

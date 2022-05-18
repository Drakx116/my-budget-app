import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/center_container.dart';
import 'package:my_budget_app/components/text/divider.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/screens/auth/registration_screen.dart';
import 'package:my_budget_app/utils/forms/login_form.dart';

class LoginScreen extends StatelessWidget
{
  final String? givenEmail;

  const LoginScreen({Key? key, this.givenEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterContainer(widgets: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Image.asset('assets/images/logo.png', width: 200),
      ),
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
              child: const Text('Je m\'inscris'),
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

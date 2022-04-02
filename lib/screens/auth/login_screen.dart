import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/center_container.dart';
import 'package:my_budget_app/utils/forms/login_form.dart';

class LoginScreen extends StatelessWidget
{
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CenterContainer(widgets: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text('Connexion',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24
          )
        ),
      ),
      LoginForm()
    ]);
  }
}

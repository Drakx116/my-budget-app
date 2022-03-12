import 'package:flutter/material.dart';
import 'package:my_budget_app/components/base_container.dart';
import 'package:my_budget_app/components/center_container.dart';
import 'package:my_budget_app/utils/forms/login.form.dart';

class LoginScreen extends StatelessWidget
{
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CenterContainer(widgets: [
      // Login page title
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text('Login Screen',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Open Sans',
              fontSize: 24
          )
        ),
      ),

      // Form
      LoginForm()
    ]);
  }
}

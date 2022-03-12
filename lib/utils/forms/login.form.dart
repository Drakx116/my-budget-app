import 'package:flutter/material.dart';
import 'fields/text.field.dart';

class LoginForm extends StatefulWidget
{
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm>
{
  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          const FormTextField(label: 'Email'),
          const FormTextField(label: 'Password'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
                onPressed: () {},
                child: const Text('Se connecter')
            ),
          )
        ],
      ),
    );
  }
}
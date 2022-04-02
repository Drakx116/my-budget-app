import 'package:flutter/material.dart';
import 'package:my_budget_app/constants/form_field.constants.dart' as field_type;
import 'package:my_budget_app/screens/homepage.screen.dart';
import 'package:my_budget_app/services/api/auth/login.dart';
import 'package:my_budget_app/services/secure_storage.service.dart';
import 'package:my_budget_app/utils/forms/fields/text.field.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget
{
  const LoginForm({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm>
{
  _LoginFormState();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final api = context.read<APIService>.call();
    final storage = context.read<SecureStorage>.call();

    var emailField = FormTextField(label: 'Adresse Email', controller: emailController, type: field_type.EMAIL);
    var passwordField = FormTextField(label: 'Mot de Passe', controller: passwordController, type: field_type.LOGIN_PASSWORD);

    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          emailField,
          passwordField,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  if (!(emailField.isValid() && passwordField.isValid())) {
                    return;
                  }

                  // At this point, the email and password fields are valid and well set
                  var token = await api.login(
                      email: emailField.getValue() ?? '',
                      password: passwordField.getValue() ?? ''
                  );

                  await storage.write('token', token);

                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomepageScreen()),
                  );
                } catch (e) {
                  // TODO : Handle errors (401 especially) with Flash messages
                  print(e);
                  return;
                }
              },
              child: const Text('Se connecter')
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
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

    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          FormTextField(label: 'Adresse Email', controller: emailController, icon: Icons.email),
          FormTextField(label: 'Mot de Passe', controller: passwordController, icon: Icons.lock),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
                onPressed: () async {
                  try {
                    var email = emailController.text;
                    var password = passwordController.text;

                    if (email.isEmpty || password.isEmpty) {
                      return;
                    }

                    var token = await api.login(email: email, password: password);

                    await storage.write('token', token);

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomepageScreen()),
                    );
                  } catch (e) {
                    // TODO : Handle errors (401 especially)
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
import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/base_container.dart';
import 'package:my_budget_app/components/snackbar.dart';
import 'package:my_budget_app/constants/form_field_constants.dart' as field_type;
import 'package:my_budget_app/constants/snackbar_status_constants.dart' as level;
import 'package:my_budget_app/models/api/requests/user_login.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/services/api_service.dart';
import 'package:my_budget_app/services/secure_storage_service.dart';
import 'package:my_budget_app/utils/forms/fields/text_field.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget
{
  // This optional parameter si meant to pass the email on valid registration
  final String? givenEmail;

  const LoginForm({ Key? key, this.givenEmail }) : super(key: key);

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
    var emailField = ExtendedFormTextField(label: 'Adresse Email', controller: emailController, type: field_type.EMAIL);
    var passwordField = ExtendedFormTextField(label: 'Mot de Passe', controller: passwordController, type: field_type.LOGIN_PASSWORD);

    if (widget.givenEmail != null && widget.givenEmail!.isNotEmpty) {
      emailField.setValue(widget.givenEmail ?? '');
    }

    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          emailField,
          passwordField,
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  if (!(emailField.isValid() && passwordField.getValue()!.isNotEmpty)) {
                    return;
                  }

                  var credentials = UserLoginModel.fromJson({
                    "username": emailField.getValue(),
                    "password": passwordField.getValue(),
                  });

                  final api = context.read<APIService>.call();
                  final storage = context.read<SecureStorage>.call();

                  // TODO : Validate token integrity
                  var token = await api.login(credentials: credentials);

                  // Store token
                  await storage.write('token', token);

                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BaseContainer()),
                  );
                }
                catch (e) {
                  if (e.toString().contains('401')) {
                    const ExtendedSnackBar(
                      content: 'Combinaison adresse email et mot de passe éronnée.',
                      status: level.ERROR,
                    ).show(context);
                  }
                  return;
                }
              },
              child: const Text('Je me connecte'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 8, horizontal: 24))
              ),
            ),
          )
        ],
      ),
    );
  }
}
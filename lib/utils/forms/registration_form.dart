import 'package:flutter/material.dart';
import 'package:my_budget_app/components/snackbar.dart';
import 'package:my_budget_app/constants/form_field_constants.dart' as field_type;
import 'package:my_budget_app/constants/snackbar_status_constants.dart' as level;
import 'package:my_budget_app/models/api/requests/user_register.dart';
import 'package:my_budget_app/screens/auth/login_screen.dart';
import 'package:my_budget_app/services/api_service.dart';
import 'package:my_budget_app/utils/forms/fields/text_field.dart';
import 'package:provider/provider.dart';

class RegistrationForm extends StatefulWidget
{
  const RegistrationForm({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationFormState();
  }
}

class _RegistrationFormState extends State<RegistrationForm>
{
  _RegistrationFormState();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    birthDateController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var firstNameField = ExtendedFormTextField(type: field_type.FIRSTNAME, label: 'Prénom', controller: firstNameController);
    var lastNameField = ExtendedFormTextField(type: field_type.LASTNAME, label: 'Nom de famille', controller: lastNameController);
    var birthDateField = ExtendedFormTextField(type: field_type.BIRTHDATE, label: 'Date de naissance', controller: birthDateController);
    var emailField = ExtendedFormTextField(type: field_type.EMAIL, label: 'Adresse email', controller: emailController);
    var passwordField = ExtendedFormTextField(type: field_type.PASSWORD, label: 'Mot de passe', controller: passwordController);
    var confirmPasswordField = ExtendedFormTextField(type: field_type.PASSWORD, label: 'Confirmer le mot de passe', controller: confirmPasswordController);

    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          firstNameField,
          lastNameField,
          birthDateField,
          emailField,
          passwordField,
          confirmPasswordField,
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ElevatedButton(
                onPressed: () async {
                  try {
                    if (!(
                      firstNameField.isValid() &&
                      lastNameField.isValid() &&
                      birthDateField.isValid() &&
                      emailField.isValid() &&
                      passwordField.isValid() &&
                      confirmPasswordField.isValid()
                    )) {
                      return;
                    }

                    if (passwordField.getValue() != confirmPasswordField.getValue()) {
                      const ExtendedSnackBar(
                        content: 'Les mots de passe saisis sont différents.',
                        status: level.WARNING,
                      ).show(context);
                    }

                    var api = context.read<APIService>.call();

                    var user = UserRegisterModel.fromJson({
                      'firstName': firstNameField.getValue(),
                      'lastName': lastNameField.getValue(),
                      'birthDate': birthDateField.getValue(),
                      'email': emailField.getValue(),
                      'password': passwordField.getValue(),
                    });

                    try {
                      // TODO : Handle errors if statusCode >= 300
                      var response = await api.register(user);
                    } catch (e) {
                      print(e);
                      return;
                    }

                    const ExtendedSnackBar(
                      content: 'Le compte a été créé avec succès.',
                      status: level.SUCCESS,
                    ).show(context);

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen(givenEmail: user.email)),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('S\'inscrire')
            ),
          )
        ]
      )
    );
  }
}
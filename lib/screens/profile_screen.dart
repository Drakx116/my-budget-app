import 'package:flutter/material.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/services/secure_storage_service.dart';
import 'package:provider/provider.dart';
import 'auth/login_screen.dart';

class ProfileScreen extends StatelessWidget
{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const WidgetTitle(text: 'Mon profil'),
      ElevatedButton(
        onPressed: () async {
          var secureService = context.read<SecureStorage>.call();
          await secureService.delete('token');

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())
          );
        },
        child: const Text('Se déconnecter'),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColor.PRIMARY)),
      )
    ]);
  }
}
import 'package:flutter/material.dart';
import 'package:my_budget_app/services/secure_storage_service.dart';
import 'package:provider/provider.dart';
import 'auth/login_screen.dart';

class ProfileScreen extends StatelessWidget
{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Profile Screen'),
      ElevatedButton(
          onPressed: () async {
            var secureService = context.read<SecureStorage>.call();
            await secureService.delete('token');

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen())
            );
          },
          child: const Text('Se déconnecter')
      )
    ]);
  }
}
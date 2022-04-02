import 'package:flutter/material.dart';
import 'package:my_budget_app/screens/auth/login.screen.dart';
import 'package:my_budget_app/services/secure_storage.service.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to Your Budget App !'),
            ElevatedButton(
              onPressed: () async {
                var secureService = context.read<SecureStorage>.call();
                await secureService.delete('token');

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                );
              },
              child: const Text('Se déconnecter')
            )
          ],
        ),
      ),
    );
  }
}
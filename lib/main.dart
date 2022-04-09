import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_budget_app/models/secured_item_model.dart';
import 'package:my_budget_app/screens/auth/login_screen.dart';
import 'package:my_budget_app/screens/homepage_screen.dart';
import 'package:my_budget_app/services/api_service.dart';
import 'package:my_budget_app/services/secure_storage_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(MultiProvider(providers: [
    Provider(create: (_) => Dio()),
    Provider(create: (_) => SecureStorage()),
    Provider<APIService>(
      create: (ctx) => APIService(ctx.read()),
    )
  ], child: const App()));
}

// App entry point - Handles authentication state
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: FutureBuilder(
        future: context.read<SecureStorage>.call().get('token'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var tokenSecuredItem = snapshot.data;
            if (tokenSecuredItem is SecuredItem) {
              return const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: HomepageScreen()
              );
            }
          }

          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen()
          );
        },
      ),
    );
  }
}
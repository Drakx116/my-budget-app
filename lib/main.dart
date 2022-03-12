import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_app/screens/auth/login.screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (_) => Dio())
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
        future: null, // TODO : Handle storage call to gather the user if exists
        builder: (context, snapshot) {
          // TODO : Check snapshot state

          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
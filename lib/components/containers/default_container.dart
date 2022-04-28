import 'package:flutter/material.dart';
import 'package:my_budget_app/components/containers/base_container.dart';
import 'package:my_budget_app/models/secured_item_model.dart';
import 'package:my_budget_app/screens/auth/login_screen.dart';
import 'package:my_budget_app/services/secure_storage_service.dart';
import 'package:provider/provider.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<SecureStorage>.call().get('token'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var tokenSecuredItem = snapshot.data;
            if (tokenSecuredItem is SecuredItem) {
              return const BaseContainer();
            }
          }

          return const LoginScreen();
        },
    );
  }
}

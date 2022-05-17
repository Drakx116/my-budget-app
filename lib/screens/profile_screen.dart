import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_app/components/text/title.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/services/api_service.dart';
import 'package:my_budget_app/services/secure_storage_service.dart';
import 'package:my_budget_app/widgets/aligned_tuple_wieget.dart';
import 'package:provider/provider.dart';
import 'auth/login_screen.dart';

class ProfileScreen extends StatelessWidget
{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    APIService api = context.read<APIService>.call();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WidgetTitle(text: 'Mon profil'),
          FutureBuilder(
            future: api.getAccount(),
            builder: (context, snapshot) {
              if (ConnectionState.done == snapshot.connectionState) {
                var accountResponse = snapshot.data as Response?;
                if (accountResponse == null) {
                  WidgetsBinding.instance?.addPostFrameCallback((_){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen())
                    );
                  });

                  return Container();
                }

                var account = accountResponse.data;

                return Column(
                  children: [
                    AlignedTuple(label: 'Prénom', value: account['firstname']),
                    AlignedTuple(label: 'Nom de famille', value: account['lastname']),
                    AlignedTuple(label: 'Adresse email', value: account['email']),
                    AlignedTuple(label: 'Date de naissance', value: account['birthdate'])
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              var secureService = context.read<SecureStorage>.call();
              await secureService.delete('token');

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())
              );
            },
            child: const Text('Se déconnecter'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColor.PRIMARY),
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 16, horizontal: 32))
            ),
          )
        ]
    );
  }
}
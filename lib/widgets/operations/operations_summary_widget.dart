import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_app/constants/enums/operation_type.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/screens/auth/login_screen.dart';
import 'package:my_budget_app/services/api_service.dart';
import 'package:provider/provider.dart';

import '../single_value_tile.dart';

class OperationSummaryWidget extends StatelessWidget
{
  const OperationSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = context.read<APIService>.call();

    return Column(
      children: [
        FutureBuilder(
          future: api.getOperationSummary(),
          builder: (context, AsyncSnapshot snapshot) {
            if (ConnectionState.done == snapshot.connectionState) {
              var summaryResponse = snapshot.data as Response?;
              if (summaryResponse == null) {
                WidgetsBinding.instance?.addPostFrameCallback((_){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                  );
                });

                return Container();
              }

              Map summary = { 'income': 0, 'expense': 0 };


              List.from(summaryResponse.data).forEach((element) {
                if ('expense' == element['type']) {
                  summary['expense'] = element['total'];
                }

                if ('income' == element['type']) {
                  summary['income'] = element['total'];
                }
              });

              String expenses = summary['expense'].toString() + '€';
              String incomes = summary['income'].toString() + '€';

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SingleValueTile(
                          label: 'Total des rentrées',
                          value: incomes.toString(),
                          backgroundColor: AppColor.QUATERNARY,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: SingleValueTile(
                          label: 'Total des dépenses',
                          value: expenses.toString(),
                          backgroundColor: AppColor.SECONDARY,
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        )
      ],
    );
  }
}
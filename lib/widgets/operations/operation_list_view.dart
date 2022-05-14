import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_app/constants/enums/operation_type.dart';
import 'package:my_budget_app/constants/enums/payment_method_enum.dart';
import 'package:my_budget_app/models/api/responses/lists/operation_list_model.dart';
import 'package:my_budget_app/models/api/responses/operation_model.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/services/api_service.dart';
import 'package:provider/provider.dart';

class OperationListWidget extends StatelessWidget
{
  const OperationListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = context.read<APIService>.call();

    return Column(
      children: [
        FutureBuilder(
          future: api.getLastOperations(limit: 5),
          builder: (context, AsyncSnapshot snapshot) {
            if (ConnectionState.done == snapshot.connectionState) {
              var operationResponse = snapshot.data as Response;
              var decodedOperations = Map.fromIterable(operationResponse.data as List, key: (e) => OperationModel.fromJson(e));

              List<OperationModel> operationList = [];
              decodedOperations.forEach((key, value) => operationList.add(OperationModel.fromJson(value)));

              List<OperationModel> operations = OperationListModel(results: operationList).results;

              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: operations.length,
                itemBuilder: (BuildContext context, index) {
                  OperationType type = OperationType.values.firstWhere((element) => element.toString() == 'OperationType.' + operations[index].type);
                  PaymentMethodType method = PaymentMethodType.values.firstWhere((element) => element.toString() == 'PaymentMethodType.' + operations[index].method);

                  Color color = (type == OperationType.expense) ? AppColor.SECONDARY : AppColor.QUATERNARY;
                  String prefix = (type == OperationType.expense) ? '-' : '+';
                  String amount = prefix + operations[index].amount.toStringAsFixed(2) + '€';

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(operations[index].label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Text(amount, style: TextStyle(fontSize: 16, color: color)),
                                const Text(' en ', style: TextStyle(fontSize: 16)),
                                Text(method.value, style: const TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                        ])
                    ]),
                  );
                }
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        )
      ],
    );
  }
}
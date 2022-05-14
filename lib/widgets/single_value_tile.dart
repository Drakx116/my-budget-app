import 'package:flutter/material.dart';
import 'package:my_budget_app/resources/colors.dart';

class SingleValueTile extends StatelessWidget
{
  final String label;
  final String value;
  late Color backgroundColor;
  late Color labelColor;
  late int itemsOnRow;

  SingleValueTile({
    Key? key,
    required this.
    label, required
    this.value,
    this.backgroundColor = AppColor.DARK,
    this.labelColor = AppColor.LIGHT,
    this.itemsOnRow = 1

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(color: backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(
            color: labelColor,
            fontSize: 16,
            fontFamily: 'Metropolis Regular'
          )),
          Text(value, style: TextStyle(
            color: labelColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Metropolis Regular'
          ))
        ],
      ),
    );
  }
}
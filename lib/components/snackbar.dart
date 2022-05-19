import 'package:flutter/material.dart';
import 'package:my_budget_app/constants/snackbar_status_constants.dart' as level;

class ExtendedSnackBar extends StatelessWidget
{
  final String content;
  final String status;

  const ExtendedSnackBar({
    Key? key,
    required this.content,
    required this.status
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(vertical: 0));
  }

  void show(BuildContext context)
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(content, style: const TextStyle(fontSize: 14))
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: _getColor(),
          action: SnackBarAction(
            label: 'Fermer',
            onPressed: () {},
            textColor: Colors.white
          ),
        )
    );
  }

  ColorSwatch<int> _getColor()
  {
    switch (status)
    {
      case level.ERROR: return Colors.redAccent;
      case level.WARNING: return Colors.deepOrangeAccent;
      case level.SUCCESS: return Colors.green;
      default: return Colors.deepPurpleAccent;
    }
  }
}
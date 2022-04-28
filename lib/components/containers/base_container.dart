import 'package:flutter/material.dart';
import 'package:my_budget_app/screens/homepage_screen.dart';
import 'package:my_budget_app/screens/profile_screen.dart';

class BaseContainer extends StatefulWidget {
  const BaseContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> {
  int _currentIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static const List<Widget> _screens = <Widget>[HomepageScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: _screens.elementAt(_currentIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'About', icon: Icon(Icons.account_balance_outlined))
        ],
        onTap: _onItemTap,
        currentIndex: _currentIndex,
      ),
    );
  }
}

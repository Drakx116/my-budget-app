import 'package:flutter/material.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/screens/homepage_screen.dart';
import 'package:my_budget_app/screens/list_operation_screen.dart';
import 'package:my_budget_app/screens/daily_screen.dart';
import 'package:my_budget_app/screens/profile_screen.dart';
import 'package:my_budget_app/widgets/bottom_modal_widget.dart';

class BaseContainer extends StatefulWidget {
  final int givenIndex;

  const BaseContainer({Key? key, this.givenIndex = 0 }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.givenIndex;
  }

  void _onItemTap(int index) {
    setState(() { _currentIndex = index; });
  }

  static const List<Widget> _screens = <Widget>[ 
    HomepageScreen(), OperationListScreen(), DailyScreen(), ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: _screens.elementAt(_currentIndex),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.PRIMARY,
        onPressed: () {
          showModalBottomSheet(context: context, builder: (BuildContext context) => const BottomModal());
        },
        child: const Icon(Icons.add, color: AppColor.LIGHT),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: AppColor.PRIMARY,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(fontFamily: 'Metropolis Regular'),
        selectedLabelStyle: const TextStyle(fontFamily: 'Metropolis Regular'),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 26,
        items: const [
          BottomNavigationBarItem(label: 'Accueil', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Opérations', icon: Icon(Icons.euro)),
          BottomNavigationBarItem(label: 'Statistiques', icon: Icon(Icons.analytics_outlined)),
          BottomNavigationBarItem(label: 'Profil', icon: Icon(Icons.account_circle_rounded)),
        ],
        onTap: _onItemTap,
        currentIndex: _currentIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomBottomNavitagion extends StatelessWidget {
  const CustomBottomNavitagion({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outline_outlined),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: ""
        ),
      ],
    );
  }
}
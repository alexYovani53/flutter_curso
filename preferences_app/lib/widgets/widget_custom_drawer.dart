import 'package:flutter/material.dart';
import 'package:preferences_app/pages/pages.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  List<Menu> menu = [
    Menu(icon: Icons.home_outlined, route: HomePage.routeName, title: "Home"),
    Menu(icon: Icons.settings_outlined, route: SettingsScreen.routeName, title: "Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _getHeader(),

          ...List.from(menu.map((e) => ListTile(
            title: Text(e.title),
            leading: Icon(e.icon),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, e.route);
            },
          )))
        ],
      ),
    );
  }

  Widget _getHeader() => DrawerHeader(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/menu-img.jpg"),
          fit: BoxFit.cover,
        )),
        child: Container(),
      );
  
}

class Menu {
  final String title;
  final IconData icon;
  final String route;

  Menu({
    required this.icon,
    required this.route,
    required this.title,
  });
}

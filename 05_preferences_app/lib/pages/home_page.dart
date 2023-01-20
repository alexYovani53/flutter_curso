import 'package:flutter/material.dart';
import 'package:preferences_app/utils/app_preferences.dart';
import 'package:preferences_app/widgets/widget_custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  static const routeName = "home"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkmode: ${Preferences2.shared.mode}'),
          const Divider(),
          Text('Género: ${Preferences2.shared.genderString}'),
          const Divider(),
          Text('Nombre de usuario: ${Preferences2.shared.name}')
        ],
      ),
    );
  }
}
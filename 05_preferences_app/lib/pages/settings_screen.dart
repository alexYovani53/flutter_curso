import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme_provider.dart';
import 'package:preferences_app/utils/app_preferences.dart';
import 'package:preferences_app/widgets/widget_custom_drawer.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen ({super.key});

  static const routeName = "settings"; 

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  // bool isDarkMode = false;
  // int gener = 1;
  // String name = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Text(
                'Ajustes', 
                style: TextStyle(color: Colors.amber, fontSize: 45, fontWeight: FontWeight.w300)
              ), 
              SwitchListTile.adaptive(
                value: Preferences2.shared.mode,
                title: const Text('Darkmode'),
                onChanged: (value) {
                  Preferences2.shared.setMode = value;
                  Provider.of<ThemeProvider>(context, listen: false).setTheme(value);
                  setState(() {});
                },
              ),
              const Divider(), 
              RadioListTile(
                value: 1,
                groupValue: Preferences2.shared.gender,
                title: const Text('Msculino'),
                onChanged: (value) {
                  Preferences2.shared.setGender =  value!;
                  setState(() {});
                },
              ),
              const Divider(), 
              RadioListTile(
                value: 2,
                groupValue: Preferences2.shared.gender,
                title: const Text('Femenino'),
                onChanged: (value) {
                  Preferences2.shared.setGender = value!;
                  setState(() {});
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences2.shared.name,
                  onChanged: (value) {
                    Preferences2.shared.setname = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                    helperText: "Nombre del usuario"
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

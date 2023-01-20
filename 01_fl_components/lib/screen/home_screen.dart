import 'package:fl_components/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
        elevation: 0,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: Icon(AppRouter.menuOptions[index].icon),
                title: Text(AppRouter.menuOptions[index].name),
                onTap: () => Navigator.pushNamed(
                    context, AppRouter.menuOptions[index].route),
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: AppRouter.menuOptions.length),
    );
  }
}


import 'package:disenos/widgets/background.dart';
import 'package:disenos/widgets/card_table.dart';
import 'package:disenos/widgets/page_title.dart';
import 'package:disenos/widgets/widget_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  static const routeName = "home_page"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [

          Background(),

          _HomeBody()
        ],
      ),
      bottomNavigationBar: const CustomBottomNavitagion(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PageTitle(), 

          //Card Table
          CardTable()
        ],
      ),
    );
  }
}
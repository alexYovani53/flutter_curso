import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/provider/page_state_provider.dart';

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
      currentIndex: Provider.of<PageStateProvider>(context).selectedMenuOp,
      onTap: (value) {
         Provider.of<PageStateProvider>(context, listen: false).selectedMenuOp = value;
      },
      elevation:0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: "Mapa"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: "Direcciones"
        ),
      ],
    );
  }
}
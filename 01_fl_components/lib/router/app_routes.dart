import 'package:flutter/material.dart';

import 'package:fl_components/main.dart';
import 'package:fl_components/models/menu_option.dart';
import 'package:fl_components/screen/home_screen.dart';
import 'package:fl_components/screen/screens.dart';

class AppRouter {
  static final menuOptions = [
    MenuOption(route: ListViewTipo1Screen.routName, icon: Icons.list, name: "Lista"),
    MenuOption(route: CardsScreen.routeName, icon: Icons.card_giftcard, name: "Cards"),
    MenuOption(route: AlertScreen.routeName, icon: Icons.info, name: "Alerta"),
    MenuOption(route: AvatarScreen.routeName, icon: Icons.circle_rounded, name: "Circle Avatar"),
    MenuOption(route: AnimatedScreen.routeName, icon: Icons.animation, name: "Animated screen"),
    MenuOption(route: InputsScreen.routeName, icon: Icons.input_sharp, name: "Inputs "),
    MenuOption(route: SliderScreen.routeName, icon: Icons.slow_motion_video_rounded, name: "Sliders && Checks "),
    MenuOption(route: ListViewBuilderScreen.routeName, icon: Icons.build_circle, name: "InfiniteScroll & pull to refresh"),
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    MyApp.initRoute: (context) => const HomeScreen(),
    ListViewTipo1Screen.routName: (context) => ListViewTipo1Screen(),
    CardsScreen.routeName: (context) => const CardsScreen(),
    AlertScreen.routeName: (context) => const AlertScreen(),
    AvatarScreen.routeName: (context) => const AvatarScreen(),
    InputsScreen.routeName: (context) => const InputsScreen(),
    SliderScreen.routeName: (context) => const SliderScreen(),
    ListViewBuilderScreen.routeName: (context) => ListViewBuilderScreen(),
  };
}

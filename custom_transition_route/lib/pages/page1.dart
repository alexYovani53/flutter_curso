
import 'package:custom_transition_route/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:route_page_transitions/page_route_transitions.dart';

class Page1 extends StatelessWidget {
  const Page1 ({super.key});

  static const routeName = "page1"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          color: Colors.lightBlue,
          child: const Text('Ir a pagina2'),
          onPressed: (){
              RouteTransitions(
                context: context,
                child: const Page2(),
                animation: AnimationType.fadeIn,
                duration: const Duration(milliseconds: 600)
              );
          }
        ),
      ),
    );
  }
}
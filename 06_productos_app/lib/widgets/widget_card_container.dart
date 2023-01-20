import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      decoration: _getDecoration(),
      child: child,
    );
  }

  BoxDecoration _getDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(10, 0))
    ]
  );
}
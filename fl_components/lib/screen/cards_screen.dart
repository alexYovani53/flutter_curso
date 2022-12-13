import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  static const routeName = "cards";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cards Screen')),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            CustomCardType1(),
            CustomCardType2(
                imgeUrl:
                    "https://elviajerofeliz.com/wp-content/uploads/2015/09/paisajes-de-Canada-8.jpg"),
            CustomCardType1(),
            CustomCardType1()
          ],
        ));
  }
}

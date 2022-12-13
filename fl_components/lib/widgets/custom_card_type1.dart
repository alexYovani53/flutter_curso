import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const ListTile(
          leading: Icon(Icons.image),
          title: Text('Soy un titulo'),
          subtitle: Text('HolaMundo'),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text('Cancel')),
            TextButton(onPressed: () {}, child: const Text('Ok'))
          ],
        )
      ],
    ));
  }
}

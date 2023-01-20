import 'package:flutter/material.dart';

class BasicDesingPage extends StatelessWidget {
  const BasicDesingPage({super.key});

  static const routeName = "basi_desing"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/paisaje.jpg"),
          _buildFirstContent(),
          _buildBottonSection()
        ]
      )
    );
  }

  Widget _buildBottonSection() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        WidgetButton(icon: Icons.call, text: "CALL"),
        WidgetButton(icon: Icons.route, text: "ROUTE"),
        WidgetButton(icon: Icons.share, text: "SHARE"),
      ]
    );
  

  Widget _buildFirstContent() =>  Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [ 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey),),
            ],
          ),
          const Spacer(),
          const Icon(Icons.star, color: Colors.yellow),
          const Text('41')
        ]
      )
    );


  
}

class WidgetButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const WidgetButton({
    Key? key, required this.icon, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: Colors.blue),
        const SizedBox(height: 5),
        Text(text, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
      ]
    );
  }
}
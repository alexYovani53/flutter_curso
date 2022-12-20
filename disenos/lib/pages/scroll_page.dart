import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({super.key});

  static const routeName = "scroll_page"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Backgrund
          const Background(),
          
          //Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 40,),
              Text('11', textAlign: TextAlign.center,),
              Text('Miércoles', textAlign: TextAlign.center,),
              Spacer(),
              Icon(Icons.keyboard_arrow_down, size: 150, color: Colors.white,)
            ],
          )
        ],
      ),
    );
  }

}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: Image.asset("assets/scroll.png"),
    );
  }
}
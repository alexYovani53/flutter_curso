import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({super.key});

  static const routeName = "scroll_page"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5,0.5],
            colors: [
              Color(0xFF5EE8c5),
              Color(0xFF30BAD6)
            ]
          )
        ),
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: const [
            _Page1(),
            _Page2()
          ]
        ),
      )
    );
  }

}

class _Page1 extends StatelessWidget {
  const _Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        //Backgrund
        Background(),
        
        //Content
        MainContent(),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w600);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('11', textAlign: TextAlign.center, style: textStyle),
          Text('Miércoles', textAlign: TextAlign.center, style: textStyle),
          Spacer(),
          Icon(Icons.keyboard_arrow_down, size: 150, color: Colors.white,)
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

class _Page2 extends StatelessWidget {
  const _Page2();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF30BAD6),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF0098FA),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            shape: const StadiumBorder()
          ),
          child: const Text('Bienvenido', style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }
}
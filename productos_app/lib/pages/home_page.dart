import 'package:flutter/material.dart';
import 'package:productos_app/pages/product_page.dart';
import 'package:productos_app/widgets/index.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  static const routeName = "home"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, ProductPage.routeName),
          child: const ProductCard(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:productos_app/pages/product_page.dart';
import 'package:productos_app/services/product_services.dart';
import 'package:productos_app/widgets/index.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  static const routeName = "home"; 
  @override
  Widget build(BuildContext context) {

    final ProductsServices productsServices = Provider.of<ProductsServices>(context);
    if (productsServices.isLoading) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productsServices.products.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            productsServices.selectedProduct = productsServices.products[index];
            Navigator.pushNamed(context, ProductPage.routeName);
          },
          child: ProductCard(producto:productsServices.products[index]),
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
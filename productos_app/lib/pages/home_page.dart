import 'package:flutter/material.dart';
import 'package:productos_app/models/producto.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/services/auth_services.dart';
import 'package:productos_app/services/product_services.dart';
import 'package:productos_app/widgets/index.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  static const routeName = "home"; 
  @override
  Widget build(BuildContext context) {

    final productsServices = Provider.of<ProductsServices>(context);
    final authService = Provider.of<AuthService>(context);
    if (productsServices.isLoading) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        leading: IconButton(
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          },
          icon: const Icon(Icons.logout),
        ),
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
          productsServices.selectedProduct = Producto(available: false, name: "", price: 0.0);
          Navigator.pushNamed(context, ProductPage.routeName);
        },
      ),
    );
  }
}
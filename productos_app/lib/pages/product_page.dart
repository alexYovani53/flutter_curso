import 'package:flutter/material.dart';
import 'package:productos_app/utils/app_decoration_input.dart';
import 'package:productos_app/widgets/index.dart';

class ProductPage extends StatelessWidget {
  const ProductPage ({super.key});

  static const routeName = "product"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImage(),

                Positioned(
                  top: 60, left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: 60, right: 20,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                    ),
                  ),
                )
              ],
              
            ),
            const _ProductForm(),
            const SizedBox(height: 100,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.save_alt),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: _buildDecoration(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              decoration: AppDecorationInput.authInputDecoration(hintText: 'Nombre del producto', labelText: "Nombre"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: AppDecorationInput.authInputDecoration(hintText: '\$150', labelText: "Precio"),
            ),
            const SizedBox(height: 20),
            SwitchListTile.adaptive(
              title: const Text('Disponible'),
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
  );
}
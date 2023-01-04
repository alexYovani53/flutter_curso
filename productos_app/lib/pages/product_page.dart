import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productos_app/models/producto.dart';
import 'package:productos_app/provider/product_form_provider.dart';
import 'package:productos_app/services/product_services.dart';
import 'package:productos_app/utils/app_decoration_input.dart';
import 'package:productos_app/widgets/index.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  ProductPage ({super.key});

  static const routeName = "product"; 
  late Producto producto;

  @override
  Widget build(BuildContext context) {
    producto = Provider.of<ProductsServices>(context).selectedProduct!;
    return ChangeNotifierProvider(
      create: (context) => ProductFormProvider(producto: producto.copy()),
      child:  const _ProductBody(),
    );
  }
}

class _ProductBody extends StatelessWidget {
  const _ProductBody({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<ProductFormProvider>(context, listen: false);
    final formProvider2 = Provider.of<ProductFormProvider>(context);
    final productService = Provider.of<ProductsServices>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(picture: formProvider2.producto.picture),
                Positioned(
                  top: 60, left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 30),
                  ),
                ),
                Positioned(
                  top: 60, right: 20,
                  child: IconButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 100); 

                      if (pickedFile == null) return;
                      productService.updateSelectedProductImage(pickedFile.path);
                      formProvider.updateSelectedProductImage(pickedFile.path);
                    },
                    icon: const Icon(Icons.camera_alt_outlined, size: 30),
                  ),
                )
              ],
              
            ),
            const _ProductForm(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<ProductsServices>(context).isSaving 
          ? null
          : () async {
              if(!formProvider.isValidForm()) return;
              final response = await productService.uploadImage();
              if (response != null) {
                formProvider.producto.picture = response;
              }
              await productService.saveOrCreateProduct(formProvider.producto);
            },
        child: Provider.of<ProductsServices>(context).isSaving 
          ? const CircularProgressIndicator(color: Colors.white)
          : const Icon(Icons.save_outlined),
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
    final formProvider = Provider.of<ProductFormProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: _buildDecoration(),
        child: Form(
          key: formProvider.formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                initialValue: formProvider.producto.name,
                onChanged: (value) => formProvider.producto.name = value,
                validator: (value) {
                  return (value == null || value.isEmpty)
                    ? 'El nombre es obligatorio'
                    : null;
                },
                decoration: AppDecorationInput.authInputDecoration(hintText: 'Nombre del producto', labelText: "Nombre"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: formProvider.producto.price.toString(),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) => formProvider.producto.price = double.tryParse(value) ?? 0.0,
                validator: (value) {
                  return (value == null || value.isEmpty)
                    ? 'El nombre es obligatorio'
                    : null;
                },
                decoration: AppDecorationInput.authInputDecoration(hintText: 'Precio del articulo', labelText: "Precio"),
              ),
              const SizedBox(height: 20),
              SwitchListTile.adaptive(
                title: const Text('Disponible'),
                value: formProvider.producto.available,
                onChanged: (value) => formProvider.updateAvailability(value),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
  );
}
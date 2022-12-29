import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 450,
        decoration: _buildDecoration(),
        child: const FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage("https://via.placeholder.com/400x300/green"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(45),
      topRight: Radius.circular(45),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 5)
      )
    ]
  );
}
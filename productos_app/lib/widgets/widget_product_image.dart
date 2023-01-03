import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? picture;
  const ProductImage({super.key, this.picture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 450,
        decoration: _buildDecoration(),
        child: Opacity(
          opacity: 0.8,
          child: FadeInImage(
            placeholder: const AssetImage("assets/jar-loading.gif"),
            image: picture != null ? NetworkImage(picture!) : const AssetImage("assets/no-image.png") as ImageProvider,
            fit: BoxFit.cover,
          ),
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
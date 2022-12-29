import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        height: 400,
        decoration: _getDecoration(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: const [
            _BackGroundImage(),
            _ProductDetails(),
            Positioned(top: 0, right: 0,child: _PriceTag()),
            Positioned(top: 0, left: 0,child: _NotAvailable()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() => BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(20), 
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0,7),
          blurRadius: 10
        )
      ]
    );
  
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$103.99',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Disco duro G',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Disco duro G',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() =>  const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(topRight: Radius.circular(20))
    );
  
}

class _BackGroundImage extends StatelessWidget {
  const _BackGroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: const SizedBox(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage("https://via.placeholder.com/400x300/f6f6f6"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
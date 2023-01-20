import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imgeUrl;
  const CustomCardType2({
    Key? key,
    required this.imgeUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            width: double.infinity,
            height: 220,
            placeholder: const AssetImage("assets/img/loading.gif"),
            fit: BoxFit.cover,
            image: NetworkImage(imgeUrl),
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: const Text('Un hermoso paisaje'),
          )
        ],
      ),
    );
  }
}

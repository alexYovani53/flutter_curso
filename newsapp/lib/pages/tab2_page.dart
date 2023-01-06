import 'package:flutter/material.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/listas_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page ({super.key});

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _ListaCategorias(),
            Expanded(
              child: ListasNoticias(noticias: newsServices.getArticulosCategoriaSeleccionada),
            )
          ],
        )
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.redAccent,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _CategoryButton(categorie: categories[index]),
                const SizedBox(height: 5),
                Text("${cName[0].toUpperCase()}${cName.substring(1)}")
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.categorie,
  }) : super(key: key);

  final Category categorie;

  @override
  Widget build(BuildContext context) {
    final newsSV = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categorie.name;
      },
      child: Container( 
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.white
        ),
        child: Icon(
          categorie.icon,
          color: newsSV.selectedCategory == categorie.name ? Colors.red: Colors.black54,
        ),
      ),
    );
  }
}
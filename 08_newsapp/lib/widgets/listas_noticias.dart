import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/theme/app_theme.dart';

class ListasNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListasNoticias({
    Key? key,
    required this.noticias,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) => _Noticia(noticia: noticias[index], index: index,)
      );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;
  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia,index: index),
        _TarjetaTitulo(noticia),
        _TarjetaImagen(noticia),
        _Tarjetabody(noticia),
        const _TarjetaBotones(),
        const Divider(),
        const SizedBox(height: 10),
        
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.red,
            shape: RoundedRectangleBorder( borderRadius:  BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder( borderRadius:  BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}
class _Tarjetabody extends StatelessWidget {
  final Article noticia;
  const _Tarjetabody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:Text(
        noticia.description != null 
          ? noticia.description! : ""
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;
  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(50),topLeft: Radius.circular(50)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: noticia.urlToImage != null  
            ? FadeInImage(
                placeholder: const AssetImage("assets/img/giphy.gif"),
                image: NetworkImage(noticia.urlToImage!),
              )
            : Image.asset("assets/img/no-image.png")
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title ?? "",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar({
    Key? key, required this.noticia, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}.', style: TextStyle(color: AppTheme.miTema.colorScheme.secondary)),
          Text('${noticia.source?.name ?? ""}.'),
        ],
      ),
    );
  }
}
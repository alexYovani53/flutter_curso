import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/pages/pages.dart' show DetailsPage;

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, DetailsPage.routeName,
              arguments: movies[index]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage("assets/loading.gif"),
                image: NetworkImage(movies[index].fullImage)),
          ),
        ),
      ),
    );
  }
}

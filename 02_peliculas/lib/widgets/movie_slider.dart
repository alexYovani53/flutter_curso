import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> populars;
  final String? title;
  final VoidCallback nextPage;
  const MovieSlider(
      {Key? key, required this.populars, this.title, required this.nextPage})
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels >= scroll.position.maxScrollExtent - 500) {
        widget.nextPage();
      }
    });
  }

  @override
  void dispose() {
    scroll.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 265,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: scroll,
              scrollDirection: Axis.horizontal,
              itemCount: widget.populars.length,
              itemBuilder: (context, index) =>
                  _MoviePoster(movie: widget.populars[index], heroId: "favorite-${widget.populars[index].id}" ),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
    required this.movie, required this.heroId,
  }) : super(key: key);

  final Movie movie;
  final String heroId;

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 190,
      child: Column(
        children: [
          Hero(
            tag: heroId,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "details", arguments: movie),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage("assets/no-image.jpg"),
                  image: NetworkImage(movie.fullImage),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

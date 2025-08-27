import 'package:flutter/material.dart';

import 'package:my_api_project/provider/home_provider.dart';
import 'package:my_api_project/view/details_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_api_project/provider/search_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    Provider.of<HomeProvider>(context, listen: false).getUpcomingMovies();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Consumer2<SearchProvider, HomeProvider>(
          builder: (context, searchprovider, homeprovider, child) {
            final upcomingMovies =
                searchController.text.isEmpty
                    ? homeprovider.upcoming
                    : homeprovider.upcomingFiltered;
            final movies =
                searchController.text.isEmpty
                    ? homeprovider.trending
                    : homeprovider.filteredList;
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                // 🔹 Profile + Search bar
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage("images/download.jpeg"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) {
                            homeprovider.searchMovie(searchController.text);
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[850],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔹 Trending Now
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Trending Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                    ),
                    physics: BouncingScrollPhysics(),
                    itemCount: movies.length,

                    itemBuilder: (context, index) {
                      final trendingMovieImage =
                          "https://image.tmdb.org/t/p/w500${movies[index].image}";
                      final trendingMovie = movies[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MovieDetails(
                                          description:
                                              trendingMovie.description,

                                          title: trendingMovie.title,
                                          releasedate:
                                              trendingMovie.releasedate,
                                          image: trendingMovieImage,
                                          rating:
                                              trendingMovie.rating.toString(),
                                        );
                                      },
                                    ),
                                  ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  trendingMovieImage,
                                  width: 120,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          Container(color: Colors.grey[800]),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              homeprovider.trending[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              maxLines: 1, // ✅ prevent overflow
                              overflow: TextOverflow.ellipsis, // ✅ add "..."
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // 🔹 Series
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Up Coming",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                    ),
                    physics: BouncingScrollPhysics(),

                    itemCount: upcomingMovies.length,
                    itemBuilder: (context, index) {
                      final upcomingMovieImage =
                          "https://image.tmdb.org/t/p/w500${upcomingMovies[index].image}";
                      final upcomingMovie = upcomingMovies[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MovieDetails(
                                      description: upcomingMovie.description,
                                      title: upcomingMovie.title,
                                      image: upcomingMovieImage,
                                      rating: upcomingMovie.rating.toString(),
                                      releasedate: upcomingMovie.releasedate,
                                    );
                                  },
                                ),
                              ),
                          child:
                              upcomingMovieImage.isEmpty
                                  ? CircularProgressIndicator()
                                  : Image.network(
                                    upcomingMovieImage,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                        ),
                      );
                    },
                  ),
                ),

                // 🔹 Korean TV Drama
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Korean TV Drama",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    itemCount:
                        searchprovider.movieSections["Korean TV Drama"]!.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8.0),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(
                              searchprovider
                                  .movieSections["Korean TV Drama"]![index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

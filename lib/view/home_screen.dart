
import 'package:flutter/material.dart';
import 'package:my_api_project/view/details_screen.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).getTrendingData();
    
    // Provider.of<HomeProvider>(context, listen: false).getPopularTvShows();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Banner Section =====
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 450,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Image.network("https://static1.srcdn.com/wordpress/wp-content/uploads/2024/01/john-wick-franchise-poster.jpg",fit: BoxFit.contain,)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow),
                            label: const Text("Play"),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(),));
                            },
                            child: const Text("Details"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ===== Trending Now Section =====
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Trending Now",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text("See all", style: TextStyle(color: Colors.grey)),
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

                    itemCount: provider.trending.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) {
                                        return  MovieDetails(
                                        description:
                                            provider
                                                .trending[index]
                                                .description,
                                                title: provider.trending[index].title,
                                                image: provider.trending[index].image,
                                                rating: provider.trending[index].rating,
                                                releasedate: provider.trending[index].releasedate,
                                          );}
                                ),
                              ),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500${provider.trending[index].image}",
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // ===== Series Section =====
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Popular Tv Shows",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text("See all", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 200,
                //   child: GridView.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 3,
                //       childAspectRatio: 0.7,
                //     ),
                //     physics: BouncingScrollPhysics(),

                //     itemCount: provider.popular.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: GestureDetector(
                //           onTap:
                //               () => Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder:
                //                       (context) {
                //                         return  MovieDetails(
                //                         description:
                //                             provider
                //                                 .popular[index]
                //                                 .description,
                //                                 title: provider.popular[index].title,
                //                                 image: provider.popular[index].image,
                //                                 rating: provider.popular[index].rating,
                //                                 releasedate: provider.popular[index].releasedate,
                //                           );}
                //                 ),
                //               ),
                //           child: Image.network(
                //             "https://image.tmdb.org/t/p/w500${provider.popular[index].image}",
                //             width: 120,
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

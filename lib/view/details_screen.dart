import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_api_project/provider/details_provider.dart';

class MovieDetails extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String rating;
  final String releasedate;
  const MovieDetails({super.key, required this.description,required this.image,required this.rating,required this.releasedate,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text('Preview', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Consumer<DetailsProvider>(
        builder: (context, movie, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Image.network(image),
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey[900],
                  child: const Icon(Icons.movie, color: Colors.grey, size: 60),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 8),
                      Text(movie.match, style: TextStyle(fontSize: 14, color: Colors.green[400])),
                      SizedBox(height: 4),
                      Text(releasedate, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 4),
                      Text(rating, style: const TextStyle(fontSize: 14, color: Colors.amber)),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Play', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text('Prolog', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 8),
                      Text(description, style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.4), textAlign: TextAlign.justify),
                      const SizedBox(height: 24),
                      const Text('Top Cast', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: movie.cast.length,
                    itemBuilder: (context, index) {
                      final actor = movie.cast[index];
                      return Container(
                        margin: const EdgeInsets.only(right: 16),
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              width: 60, height: 60,
                              decoration: BoxDecoration(color: Colors.grey[700], shape: BoxShape.circle),
                              child: const Icon(Icons.person, color: Colors.white, size: 30),
                            ),
                            const SizedBox(height: 8),
                            Text(actor['name']!, style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold), maxLines: 1),
                            Text(actor['role']!, style: TextStyle(fontSize: 10, color: Colors.grey[400]), maxLines: 1),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
             SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_api_project/provider/bottomnav_provider.dart';
import 'package:my_api_project/view/download_screen.dart';
import 'package:my_api_project/view/home_screen.dart';
import 'package:my_api_project/view/search_screen.dart';
import 'package:provider/provider.dart';



class BottomNavigation extends StatelessWidget {
   const BottomNavigation({super.key});

  final List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    DownloadScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: screens[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          provider.setIndex(index); 
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: "Downloads"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

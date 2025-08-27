import 'package:flutter/material.dart';
import 'package:my_api_project/provider/bottomnav_provider.dart';
import 'package:my_api_project/provider/details_provider.dart';
import 'package:my_api_project/provider/home_provider.dart';
import 'package:my_api_project/provider/search_provider.dart';
import 'package:my_api_project/view/bottom_nav_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => BottomNavProvider(),),
  ChangeNotifierProvider(create: (context) => HomeProvider(),),ChangeNotifierProvider(create: (context) => SearchProvider(),),ChangeNotifierProvider(create: (context) => DetailsProvider(),)],child:MyApp() ,) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigation());
  }
}

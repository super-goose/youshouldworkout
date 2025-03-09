import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_should_work_out/pages/favorites.dart';
import 'package:you_should_work_out/pages/generator.dart';
import 'package:you_should_work_out/state/my_app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'You Should...',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF22D6FF)),
            scaffoldBackgroundColor: Color.fromRGBO(32, 32, 32, 1.0)),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(
              64, 64, 64, 1.0), // indicatorColor: Color(0xFF22D6FF),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Color.fromARGB(255, 24, 152, 181),
          unselectedItemColor: Color(0xFFDDDDDD),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Favorites',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (value) => setState(() => selectedIndex = value),
        ),
        body: Container(
          color: Color.fromRGBO(32, 32, 32, 1.0),
          child: page,
        ),
      );
    });
  }
}

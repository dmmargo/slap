import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slap/fav_tab.dart';
import 'package:slap/form.dart';
import 'package:slap/home_tab.dart';
import 'package:slap/rng_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  HomePageState createState() => HomePageState();
  int selectedIndex = 0;
  //List<Widget> widgetOptions = <Widget>[
  final widgetOptions = [
    new home_tab(Colors.white),
    new rng_tab(Colors.white),
    new fav_tab(Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SLAP: Sounds like a Plan',
            style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), title: Text('RNG')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorites')),
        ],
        currentIndex: selectedIndex,
        //fixedColor: Colors.pink,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black87,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

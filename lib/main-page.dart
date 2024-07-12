import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:instagram/screen/add_post.dart';
import 'package:instagram/screen/favorite.dart';
import 'package:instagram/screen/home.dart';
import 'package:instagram/screen/login.dart';
import 'package:instagram/screen/person.dart';
import 'package:instagram/screen/search.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<Widget> bottomtab = <Widget>[
    const Home(),
    const Search(),
    const AddPost(),
    const Favorite(),
    const Person(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomtab.elementAt(selectedIndex),
      bottomNavigationBar: GNav(
        tabs: const [
          GButton(
            icon: Icons.home,
          ),
          GButton(
            icon: Icons.search,
          ),
          GButton(
            icon: Icons.add_box_outlined,
          ),
          GButton(
            icon: Icons.favorite,
            iconActiveColor: Colors.blueAccent,
            iconColor: Colors.grey,
          ),
          GButton(
            icon: Icons.person,
          ),
        ],
        selectedIndex: selectedIndex,
        onTabChange: (value) {
          setState(() {
            selectedIndex = value;
            autLoginController.initializeToken();
          });
        },
      ),
    );
  }
}

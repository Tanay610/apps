import 'package:e_fashion_app/screens/cart.dart';
import 'package:e_fashion_app/screens/home.dart';
import 'package:e_fashion_app/screens/search.dart';
import 'package:e_fashion_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:line_icons/line_icons.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:faded_widget/faded_widget.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  bool isSearchActive = false;
  final int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        title: isSearchActive
            ? const FadeIn(
                duration: Duration(milliseconds: 300),
                child: Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )
            : const FadeIn(
                child: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = !isSearchActive;
              });
            },
            icon: const Icon(LineIcons.search),
            color: Colors.black,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            },
            icon: Icon(LineIcons.shoppingBag),
            color: Colors.black,
            iconSize: 30,
          ),
        ],
      ),
      body: isSearchActive ? Search() : const Home(),
      bottomNavigationBar: BottomBarBubble(
        color: primarColor,
        selectedIndex: _index,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.search),
          BottomBarItem(iconData: Icons.explore),
          BottomBarItem(iconData: Icons.settings),
          BottomBarItem(iconData: Icons.mail),
        ],
        onSelect: (index) {},
      ),
    );
  }
}

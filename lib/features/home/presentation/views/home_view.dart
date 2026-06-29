import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home View")),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/home_icon.png"),
              height: 30,
              width: 30,
            ),
            label: "other",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/chats_icon.png"),
              height: 30,
              width: 30,
            ),
            label: "chats",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/profile_icon.png"),
              height: 30,
              width: 30,
            ),
            label: "profile",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lab2/model/user.dart';
import 'package:lab2/view/favourite.dart';
import 'package:lab2/view/subjects.dart';
import 'package:lab2/view/profile.dart';
import 'package:lab2/view/subscribe.dart';
import 'package:lab2/view/tutors.dart';

class MainPage extends StatefulWidget {
  final User user;
  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> tabchildren;
  int _currentIndex = 0;
  String maintitle = "Profile";

  @override
  void initState() {
    super.initState();
    tabchildren = [
      Subjects(user: widget.user),
      Tutor(user: widget.user),
      subscribe(),
      Favourite(),
      Profile(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tutor'),
      ),
      body: tabchildren[_currentIndex], //mention!!!!!
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.subject_outlined,
              ),
              label: "Subjects",
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
              ),
              label: "Tutor",
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.subscriptions ,
              ),
              label: "Subscribe",
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "Favourite",
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
              backgroundColor: Colors.blueGrey)
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        maintitle = "Subjects";
      }
      if (_currentIndex == 1) {
        maintitle = "Tutors";
      }
      if (_currentIndex == 2) {
        maintitle = "Subscribe";
      }
      if (_currentIndex == 3) {
        maintitle = "Favourite";
      }
      if (_currentIndex == 4) {
        maintitle = "Profille";
      }
    });
  }
}

import 'package:ananix_junior_project/src/presentation/screens/active_user_screen.dart';
import 'package:flutter/material.dart';
import '../../data/constants.dart';

class ScreenSelectorManager extends StatefulWidget {
  const ScreenSelectorManager({Key? key}) : super(key: key);

  @override
  State<ScreenSelectorManager> createState() => _ScreenSelectorManagerState();
}

class _ScreenSelectorManagerState extends State<ScreenSelectorManager> {
  int _selectedTab = 0;

  void onSelectTab(int index){
    setState(() {
      if(_selectedTab == index){
        return;
      }
      _selectedTab = index;
    });
  }
   static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
     ActiveUserScreen()

     // Text(
    //   'Index 1: Business',
    // ),
    // AllUserScreen(),
    // ActiveUserScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurple,
        title: const Text('Go REST All Users List'),
      ),
      // backgroundColor: Colors.green,
      body: _widgetOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: kPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: kPurpleAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle_rounded,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon),
            label: '',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}

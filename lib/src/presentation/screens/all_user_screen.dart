import 'package:ananix_junior_project/src/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../data/constants.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurple,
        title: const Text('Go REST All Users List'),
      ),
      // backgroundColor: Colors.green,
      body: Column(
        children: [
         ItemCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon),
            label: 'Open Dialog',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          // switch (index) {
          //   case 0:
          //   // only scroll to top when current index is selected.
          //   //   if (_selectedIndex == index) {
          //   //     _homeController.animateTo(
          //   //       0.0,
          //   //       duration: const Duration(milliseconds: 500),
          //   //       curve: Curves.easeOut,
          //       );
          //     }
          //     break;
          //   case 1:
          //     showModal(context);
          //     break;
          // }
          // setState(
          //       () {
          //     // _selectedIndex = index;
          //   },
          // );
        },
      ),

    );
  }
}

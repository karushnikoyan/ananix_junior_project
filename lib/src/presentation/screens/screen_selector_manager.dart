import 'package:ananix_junior_project/src/presentation/screens/active_user_screen.dart';
import 'package:ananix_junior_project/src/presentation/widgets/checkbox_gender.dart';
import 'package:flutter/material.dart';
import '../../data/constants.dart';
import 'all_users_screen.dart';

class ScreenSelectorManager extends StatefulWidget {
  const ScreenSelectorManager({Key? key}) : super(key: key);

  @override
  State<ScreenSelectorManager> createState() => _ScreenSelectorManagerState();
}

class _ScreenSelectorManagerState extends State<ScreenSelectorManager> {
  int _selectedTab = 0;
  String appbarTitle = "Go REST All Users List";

  void onSelectTab(int index) {
    setState(() {
      if (_selectedTab == index) {
        return;
      }
      if (_selectedTab == 0) {
        appbarTitle = "Go REST Active User List";
      } else {
        appbarTitle = "Go REST All Users List";
      }
      _selectedTab = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    AllUserScreen(),
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
        title: Text(appbarTitle),
      ),
      // backgroundColor: Colors.green,
      body: _widgetOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: kPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: kPurpleAccent,
        items:  <BottomNavigationBarItem>[
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              // <-- SEE HERE
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                height: 300,
                child: Padding(
                  padding:  EdgeInsets.only(left: 24, right: 24, top: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Creat Useer",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Icon(Icons.close),
                        ],
                      ),
                      // MyTextFiled("mm",TextInputType.text),
                      // MyTextFiled("mm",TextInputType.text),
                      TextFormField(
                        decoration: InputDecoration(
                          /// ToDo add label in constructor
                          labelText: "Enter Name",
                        ),
                        keyboardType: TextInputType.name,
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          if (value == null || value.length < 2) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      TextFormField(
                        decoration:  InputDecoration(
                          /// ToDo add label in constructor
                          labelText: "Enter emile",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          if (value == null || value.length < 2) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize: 18, color: kGray,),
                              ),
                              MyCheckboxGender()
                            ]),
                      ),

                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Padding(
                      ///ToDO correct size save button
                      padding: const EdgeInsets.only(left: 140,right: 140),
                      child: Text("Save"),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // <-- Radius
                        ),
                        backgroundColor:  kPurple ),
                  ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: kPurple,
      ),
    );
  }
}

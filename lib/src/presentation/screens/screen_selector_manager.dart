import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
import 'package:ananix_junior_project/src/presentation/screens/active_user_screen.dart';
import 'package:ananix_junior_project/src/presentation/widgets/checkbox_gender.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../data/constants.dart';
import '../models/people_model.dart';
import '../provider/button_sheet_provider.dart';
import '../widgets/ananix_chackbox.dart';
import 'all_users_screen.dart';

class ScreenSelectorManager extends StatefulWidget {
  const ScreenSelectorManager({Key? key}) : super(key: key);

  @override
  State<ScreenSelectorManager> createState() => _ScreenSelectorManagerState();
}

class _ScreenSelectorManagerState extends State<ScreenSelectorManager> {
  int _selectedTab = 0;
  String appbarTitle = "Go REST All Users List";

  final form = FormGroup({
    "email": FormControl(
      validators: [
        Validators.required,
        Validators.email,
        Validators.minLength(2)
      ],
    ),
    "name": FormControl(validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.pattern(RegExp(r'^[a-zA-Z ]+$'))
    ])
  });

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurple,
        title: Text(appbarTitle),
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          People? people = await showModalBottomSheet<People?>(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return Consumer<ButtonSheetProviderAnnaniks>(
                  builder: (conte, provider, _) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      height: 400,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24, right: 24, top: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Creat Useer",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                    child: Icon(Icons.close)),
                              ],
                            ),
                            ReactiveForm(
                              formGroup: form,
                              child: Column(
                                children: [
                                  ReactiveTextField(
                                    decoration: const InputDecoration(
                                      labelText: "Enter name",
                                    ),
                                    formControlName: 'name',
                                    validationMessages: {
                                      ValidationMessage.required: (error) =>
                                          "Please Fill Your Name",
                                      ValidationMessage.pattern: (error) =>
                                          "Write correct name",
                                      ValidationMessage.minLength: (error) =>
                                          "Minimum length is 2",
                                    },
                                    controller: provider.nameController,
                                  ),
                                  ReactiveTextField(
                                    decoration: const InputDecoration(
                                      labelText: "Enter email",
                                    ),
                                    formControlName: 'email',
                                    validationMessages: {
                                      ValidationMessage.required: (error) =>
                                          "Fill your email",
                                      ValidationMessage.email: (error) =>
                                          "Write correct email",
                                    },
                                    controller: provider.emileController,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Gender :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: kGray,
                                      ),
                                    ),
                                    AnnaniksCheckboxGender()
                                  ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Status :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kGray,
                                  ),
                                ),
                                AnnaniksCheckbox(),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                form.markAllAsTouched();
                                if (form.valid) {
                                  People? newPeople = await provider.addUser();
                                  Navigator.of(context).pop(newPeople);
                                }

                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // <-- Radius
                                  ),
                                  backgroundColor: kPurple),
                              child: const Padding(
                                ///ToDO correct size save button
                                padding: EdgeInsets.only(left: 140, right: 140),
                                child: Text("Save"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              });
          if (people != null) {
            context.read<AllUsersProvider>().getItems();
          }
        },
        child: Icon(Icons.add),
        backgroundColor: kPurple,
      ),
    );
  }
}

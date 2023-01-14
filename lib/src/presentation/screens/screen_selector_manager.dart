import 'package:ananix_junior_project/src/presentation/screens/active_user_screen.dart';
import 'package:ananix_junior_project/src/presentation/widgets/checkbox_gender.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../data/constants.dart';
import '../provider/button_sheet_provider.dart';
import '../widgets/my_chackbox_gpt.dart';
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
    "name" : FormControl(
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.pattern(RegExp(r'^[a-zA-Z ]+$'))

      ]
    )
  });

  // final formKay = GlobalKey<FormState>();
  // final emailValidators = MultiValidator([
  //   RequiredValidator(errorText: 'Email is required'),
  //   MinLengthValidator(8, errorText: 'Email must be at least 8 digits long'),
  //   PatternValidator(r'(?=@.*?[#?!S$%^&*-@.])',
  //       errorText: 'Email must have at least one special character')
  // ]);

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
    return Consumer<ButtonSheetProviderMy>(builder: (context, provider, _) {
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
          items: <BottomNavigationBarItem>[
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
                  height: 400,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Creat Useer",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Icon(Icons.close),
                          ],
                        ),
                        ReactiveForm(
                            formGroup: form,
                            child: Column(
                              children: [
                                ReactiveTextField(
                            decoration: InputDecoration(
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
                                ),
                                ReactiveTextField(
                                  decoration: InputDecoration(
                                    labelText: "Enter email",

                                  ),
                                  formControlName: 'email',
                                  validationMessages: {
                                    ValidationMessage.required: (error) =>
                                        "partadir",
                                    ValidationMessage.email: (error) =>
                                        "email gre ara",

                                  },
                                  ///ToDo add controllor TexEditingControlior
                                  // controller: ,
                                ),


                                // TextFormField(
                                //   decoration: InputDecoration(
                                //     labelText: "Enter Name",
                                //   ),
                                //   keyboardType: TextInputType.name,
                                //   onSaved: (String? value) {},
                                //   validator: (String? value) {
                                //     // if (value == null || value.length < 2) {
                                //     //   return 'Please enter some text';
                                //     // }
                                //     return "______________________text";
                                //   },
                                // ),

                                // TextFormField(
                                //   decoration: InputDecoration(
                                //     labelText: "Enter emile",
                                //   ),
                                //   keyboardType: TextInputType.emailAddress,
                                //   onSaved: (String? value) {
                                //     // This optional block of code can be used to run
                                //     // code when the user saves the form.
                                //   },
                                //   validator: (String? value) {
                                //     if (value == null || value.length < 2) {
                                //       return 'Please enter some text';
                                //     }
                                //   },
                                // ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Gender :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kGray,
                                  ),
                                ),
                                MyCheckboxGender()
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Status :",
                              style: TextStyle(
                                fontSize: 18,
                                color: kGray,
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: (){
                            //     provider.isCheckedF();
                            //   },
                            //   child: Container(
                            //     height: 20,
                            //     width: 20,
                            //     color: Colors.red,
                            //     child: Icon(provider.isChecked ? Icons.done : Icons.nearby_off_outlined),),
                            // ),
                            //
                            // Checkbox(
                            //   checkColor: Colors.red,
                            //   // fillColor: MaterialStateProperty.resolveWith(getColor),
                            //   value: provider.isChecked,
                            //   onChanged: (bool? value) {
                            //     setState(() {
                            //       provider.isCheckedF();
                            //     });
                            //   },
                            // ),
                            //   Checkbox( //only check box
                            //       value: provider.check1, //unchecked
                            //       onChanged: (bool? value){
                            //         //value returned when checkbox is clicked
                            //         setState(() {
                            //           provider.check1 = value;
                            //         });
                            //       }
                            //   ),
                            //   ElevatedButton(
                            //     onPressed: () {
                            //
                            //     },
                            //     child: Icon(provider.isChecked ? Icons.done : Icons.nearby_off_outlined),
                            //     style: ElevatedButton.styleFrom(
                            //         minimumSize: Size(0.0, 0.0),
                            //         shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(0), // <-- Radius
                            //
                            //         ),
                            //         backgroundColor:  kPurple ),
                            //   ),
                            MyCheckbox(),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            form.markAllAsTouched();
                            setState(() {});
                            // formKay.currentState.validate();
                          },
                          child: Padding(
                            ///ToDO correct size save button
                            padding:
                                const EdgeInsets.only(left: 140, right: 140),
                            child: Text("Save"),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30), // <-- Radius
                              ),
                              backgroundColor: kPurple),
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
    });
  }
}




import 'package:flutter/cupertino.dart';

class ButtonSheetProviderMy with ChangeNotifier{
  late bool isMale = true;
  String gender = "male";
  bool isChecked = false;
  bool? check1 = false;

   isCheckedF(){
     isChecked = !isChecked;
     notifyListeners();
   }

isMaleTrue (){
  if(isMale != true){
    isMale = true;
    gender = "male";
    notifyListeners();
  }
}
isFemaleTrue(){
  if(isMale == true){
    isMale=false;
    gender = "female";
    notifyListeners();
  }
}


}
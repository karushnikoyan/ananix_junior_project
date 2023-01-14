


import 'package:flutter/cupertino.dart';

class ButtonSheetProviderMy with ChangeNotifier{
  late bool isMale = true;
  String gender ="male";
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
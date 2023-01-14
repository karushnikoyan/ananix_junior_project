import 'package:ananix_junior_project/src/presentation/models/people_model.dart';
import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/item_card.dart';

class AllUserScreen extends StatefulWidget {
   AllUserScreen({Key? key}) : super(key: key);

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  People? people ;

  @override
  Widget build(BuildContext context) {
    return Consumer<AllUsersProvider>(
        builder: (context, provider, _) {
          return Container(
            child:  Column(
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                  provider.getItems();

                  });
                }, child: Text('kkkkkkkk'),),
                Text("${people?.name}"),
              ],
            )
          );
        }
    );
  }
}
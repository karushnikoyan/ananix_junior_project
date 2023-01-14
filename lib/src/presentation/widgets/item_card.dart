import 'package:ananix_junior_project/src/data/constants.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ///ToDo add constructor model
  String firstName;
  String gMail;
  String male;

  ItemCard(this.firstName, this.gMail, this.male, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.8),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: Offset(-6.0, -6.0),
              blurRadius: 16.0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 12.0),
                  child: Text(
                    "FirstName Lastname",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.only(left:10.0,top:8.0),
                  child: Text("karushnikoyan@gmail.com",style: TextStyle(color: kGray),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 8.0),
                  child: Text("Male",style: TextStyle(color: kGray),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(radius: 8,backgroundColor: kGreen,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Icon(Icons.delete_forever_outlined,size: 28.0,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

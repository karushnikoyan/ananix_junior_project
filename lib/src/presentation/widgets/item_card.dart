import 'package:ananix_junior_project/src/data/constants.dart';
import 'package:ananix_junior_project/src/presentation/models/people_model.dart';
import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  int id;
  String firstName;
  String email;
  String male;
  String status;

  ItemCard(
      {required this.firstName,
      required this.email,
      required this.male,
      required this.status,
      required this.id});

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
              offset: const Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 12.0),
                  child: Text(
                    firstName,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                  child: Text(
                    "$email",
                    overflow: TextOverflow.visible,
                    style: const TextStyle(color: kGray),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                  child: Text(
                    "$male",
                    style: const TextStyle(color: kGray),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () async {
                        await context.read<AllUsersProvider>().updateUserData(
                            People(
                                id: id,
                                name: firstName,
                                gender: male,
                                status: status,
                                email: email));
                        await context.read<AllUsersProvider>().getItems();
                      },
                      child: CircleAvatar(
                          radius: 8,
                          backgroundColor:
                              status == "active" ? kGreen : kGray)),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: GestureDetector(
                        onTap: () async {
                          await context.read<AllUsersProvider>().removeUser(id);
                          await context.read<AllUsersProvider>().getItems();
                        },
                        child: const Icon(
                          Icons.delete_forever_outlined,
                          size: 24.0,
                        )),
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

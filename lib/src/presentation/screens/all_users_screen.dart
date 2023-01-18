import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/item_card.dart';

class AllUserScreen extends StatelessWidget {
  AllUserScreen({Key? key, this.onlyActives = false}) : super(key: key);
  bool onlyActives;

  @override
  Widget build(BuildContext context) {
    return Consumer<AllUsersProvider>(builder: (context, provider, _) {
      return ListView.builder(
        itemCount: provider.listPeoples.length,
        itemBuilder: (context, index) {
          return ItemCard(
              firstName: "${provider.listPeoples[index].name}",
              email: "${provider.listPeoples[index].email}",
              id: provider.listPeoples[index].id ?? -1,
              male: "${provider.listPeoples[index].gender}",
              status: "${provider.listPeoples[index].status}");
        },
      );
    });
  }
}

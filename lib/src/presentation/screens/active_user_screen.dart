import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/item_card.dart';

class ActiveUserScreen extends StatelessWidget {
  const ActiveUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AllUsersProvider>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.fetchActiveUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ItemCard(
                    firstName: "${snapshot.data?[index].name}",
                    email: "${snapshot.data?[index].email}",
                    id: snapshot.data?[index].id ?? -1,
                    male: "${snapshot.data?[index].gender}",
                    status: "${snapshot.data?[index].status}");
                // Text("${provider.listPeoples[index].name}");
              },
            );
          });
    });
  }
}

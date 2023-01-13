import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


import '../widgets/item_card.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AllUsersProvider>(
        builder: (context, provider, _) {
          return Container(
            child:  Text("${provider.getItems()}"),
          );
        }
    );
  }
}
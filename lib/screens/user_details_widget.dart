import 'package:benzy_test/common_widgets/rich_text.dart';
import 'package:flutter/material.dart';

import '../models/user_data_model.dart';

class UserDetailsWidget extends StatelessWidget {
  User? user;
  double fineAmount;
  UserDetailsWidget({
    Key? key,
    required this.user,
    required this.fineAmount,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BenzyRichText(title: "Name", subTitle: '${user?.fName} ${user?.lName}'),
          const SizedBox(height: 5,),
          BenzyRichText(title: "Email", subTitle: user?.email ?? ""),
          const SizedBox(height: 5,),
          BenzyRichText(title: "Mobile", subTitle: user?.phone ?? ""),
          const SizedBox(height: 5,),
          BenzyRichText(title: "Total Fine", subTitle: '$fineAmount'),
        ],
      ),
    );
  }
}

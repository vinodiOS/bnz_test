import 'package:benzy_test/common_widgets/rich_text.dart';
import 'package:flutter/material.dart';

class FoodStatusCard extends StatelessWidget {
  Map optsIn;

  FoodStatusCard({
    Key? key,
    required this.optsIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (optsIn["breakfast"] != null)
          BenzyRichText(title: "Breakfast", subTitle: "${optsIn["breakfast"]}"),
        const SizedBox(height: 5,),
        if (optsIn["lunch"] != null) BenzyRichText(title: "Lunch",subTitle: "${optsIn["lunch"]}"),
        const SizedBox(height: 5,),
        if (optsIn["dinner"] != null) BenzyRichText(title: "Dinner", subTitle: "${optsIn["dinner"]}")
      ],
    );
  }
}

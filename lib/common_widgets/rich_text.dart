import 'package:flutter/material.dart';

class BenzyRichText extends StatelessWidget {
  String title;
  String subTitle;
  BenzyRichText({
    Key? key,
    required this.title,
    required this.subTitle
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return          RichText(
      text: TextSpan(
        text: '$title: ',
        style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        children: [
          TextSpan(
            style: const TextStyle(fontWeight: FontWeight.normal),
            text: '$subTitle',
          ),
        ],
      ),
    );
  }
}
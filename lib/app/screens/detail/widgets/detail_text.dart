import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailText extends StatelessWidget {
  final String text;
  final dynamic value;

  const DetailText({required this.text, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$text: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(value?.toString() ?? '-'),
        ),
      ],
    );
  }
}

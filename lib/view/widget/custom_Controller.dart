// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

class CustomController extends StatelessWidget {
  final String questionText;
  final String optionOne;
  final String optionTow;

  const CustomController(
      {super.key,
      required this.questionText,
      required this.optionOne,
      required this.optionTow});

  @override
  Widget build(BuildContext context) {
    String selectedColor = 'yes';

    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(20)),
      child: StatefulBuilder(builder: (BuildContext context, setState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionText,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: Text(optionOne, style: const TextStyle(fontSize: 15)),
              value: optionOne,
              groupValue: selectedColor,
              onChanged: (value) {
                setState(() {
                  print('=====================selected');
                  selectedColor = value.toString();
                  print(selectedColor);
                });
              },
            ),
            RadioListTile(
              title: Text(optionTow, style: const TextStyle(fontSize: 15)),
              value: optionTow,
              groupValue: selectedColor,
              onChanged: (value) {
                setState(() {
                  print('=====================selected');
                  selectedColor = value.toString();
                  print(selectedColor);
                });
              },
            ),
          ],
        );
      }),
    );
  }
}

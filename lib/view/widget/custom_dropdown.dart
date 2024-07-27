// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton(
      {super.key,
      required this.value,
      required this.theList,
      required this.onChanged,
      required this.titleText});
  final String value;
  final String titleText;
  void Function(String?) onChanged;
  final List<DropdownMenuItem<String>> theList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText),
          DropdownButtonFormField(
            value: value,
            onChanged: onChanged,
            items: theList,
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

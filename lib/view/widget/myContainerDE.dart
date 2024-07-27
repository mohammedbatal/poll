// ignore_for_file: file_names
// import 'package:flutter/material.dart';

// class Mycontainer extends StatefulWidget {
//   const Mycontainer({super.key});

//   @override
//   State<Mycontainer> createState() => _MycontainerState();
// }

// class _MycontainerState extends State<Mycontainer> {
//   String selectedColor = 'Red';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("mohammed")),
//       body: Center(
//           child: Column(
//         children: [
//           mohammedController(),
//           Container(
//             margin: const EdgeInsets.all(15),
//             height: 200,
//             decoration: BoxDecoration(
//                 color: Colors.grey[400],
//                 borderRadius: BorderRadius.circular(20)),
//           ),
//         ],
//       )),
//     );
//   }

//   Container mohammedController() {
//     return Container(
//       margin: const EdgeInsets.all(15),
//       padding: const EdgeInsets.all(15),
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.grey[400], borderRadius: BorderRadius.circular(20)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('mohammedcrossAxisAlignmentAlignmentAlignm'),
//           RadioListTile(
//             title: const Text('Red'),
//             value: 'Red',
//             groupValue: selectedColor,
//             onChanged: (value) {
//               setState(() {
//                 print('=====================selectedColor');
//                 selectedColor = value.toString();
//                 print(selectedColor);
//               });
//             },
//           ),
//           RadioListTile(
//             title: Text('Blue'),
//             value: 'Blsdfsdfsdfue',
//             groupValue: selectedColor,
//             onChanged: (value) {
//               setState(() {
//                 print('=====================selectedColor');
//                 selectedColor = value.toString();
//                 print(selectedColor);
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

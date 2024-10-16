// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FruitDialog extends StatefulWidget {
//   const FruitDialog(
//       {super.key,
//         required this.title,
//         required this.color,
//         required this.image,
//         required this.deleteFruit
//       });
//
//   final String title;
//   final Color color;
//   final Image image;
//   final Function deleteFruit;
//
//   @override
//   State<FruitDialog> createState() => _FruitDialogState();
// }
//
// class _FruitDialogState extends State<FruitDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(widget.title),
//       backgroundColor: widget.color,
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[
//             widget.image,
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: const Text('Ok'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         TextButton(
//           child: const Text('Ok'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
// }

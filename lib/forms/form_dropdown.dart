// import 'package:ffuf_20220513_recipe_app/widgets/subtitle/subtitle_1.dart';
// import 'package:flutter/material.dart';

// class FromDropDown extends StatelessWidget {
  
//   String title;

//   const FromDropDown({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(15.0),
//       child: Row(
//         children: [
//           Expanded(child: Subtitle1(title)),
//           Expanded(
//             flex: 2,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(5.0)),
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 value: courseValue,
//                 underline: Container(
//                   height: 0,
//                 ),
//                 onChanged: (String? newValue) =>
//                     setState(() => courseValue = newValue!),
//                 items: Courses.values
//                     .map((name) => name.toString().split('.').elementAt(1))
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

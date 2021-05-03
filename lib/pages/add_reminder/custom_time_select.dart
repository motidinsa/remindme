// import 'package:flutter/material.dart';
//
// class CustomTimeSelect extends StatefulWidget {
//   @override
//   _CustomTimeSelectState createState() => _CustomTimeSelectState();
// }
//
// class _CustomTimeSelectState extends State<CustomTimeSelect> {
//   bool hasCustomTime = false;
//   List<Widget> customDayAndTimeWidget = [];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Custom time'),
//             SizedBox(
//               width: 10,
//             ),
//             Switch(
//               value: hasCustomTime,
//               onChanged: (value) {
//                 setState(
//                       () {
//                     hasCustomTime = value;
//                     setState(
//                           () {
//                         customDayAndTimeWidget = [];
//
//                         for (int i = 0;
//                         i < daysSelectedInNumFinal.length;
//                         i++) {
//                           if (i == daysSelectedInNumFinal.length - 1)
//                             customDayAndTimeWidget.add(
//                               CustomTime(
//                                 hasCustomTime: hasCustomTime,
//                                 day: days[daysSelectedInNumFinal[i]],
//                               ),
//                             );
//                           else {
//                             customDayAndTimeWidget.add(
//                               CustomTime(
//                                 hasCustomTime: hasCustomTime,
//                                 day: days[daysSelectedInNumFinal[i]],
//                               ),
//                             );
//                             customDayAndTimeWidget.add(
//                               Divider(
//                                 color: Colors.grey,
//                               ),
//                             );
//                           }
//                         }
//                       },
//                     );
//                     // customDayAndTimeWidget = CustomDayAndTime(
//                     //     daysSelectedInNumFinal, hasCustomTime);
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//             'With custom time disabled, days use the default time set above')
//       ],
//     );
//   }
// }

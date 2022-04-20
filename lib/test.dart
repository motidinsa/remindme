// import 'package:flutter/material.dart';
//
//
// class Test extends StatelessWidget {
//   const Test({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//             width: 375,
//             height: 812,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40),
//                 topRight: Radius.circular(40),
//                 bottomLeft: Radius.circular(40),
//                 bottomRight: Radius.circular(40),
//               ),
//               color: Color.fromRGBO(37, 40, 55, 1),
//             ),
//             child: Stack(
//                 children: <Widget>[
//                   Positioned(
//                       top: 83,
//                       left: 375,
//                       child: Container(
//                           width: 375,
//                           height: 241,
//                           decoration: BoxDecoration(
//                             color: Color.fromRGBO(66, 66, 66, 1),
//                           ),
//                           child: Stack(
//                               children: <Widget>[
//                                 Positioned(
//                                     top: 0,
//                                     left: 0,
//                                     child: Container(
//                                         width: 375,
//                                         height: 241,
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(65, 65, 65, 1),
//                                         )
//                                     )
//                                 ), Positioned(
//                                     top: -63,
//                                     left: -156,
//                                     child: Container(
//                                         width: 573,
//                                         height: 348,
//
//                                         child: Stack(
//                                             children: <Widget>[
//                                               Positioned(
//                                                   top: 0,
//                                                   left: 163,
//                                                   child: Container(
//                                                       width: 410,
//                                                       height: 348,
//                                                       decoration: BoxDecoration(
//                                                         image: DecorationImage(
//                                                             image: AssetImage(
//                                                                 'assets/images/Image12.png'),
//                                                             fit: BoxFit.fitWidth
//                                                         ),
//                                                       )
//                                                   )
//                                               ), Positioned(
//                                                   top: 63,
//                                                   left: 0,
//                                                   child: Container(
//                                                       width: 259,
//                                                       height: 222,
//                                                       decoration: BoxDecoration(
//                                                         image: DecorationImage(
//                                                             image: AssetImage(
//                                                                 'assets/images/Image13.png'),
//                                                             fit: BoxFit.fitWidth
//                                                         ),
//                                                       )
//                                                   )
//                                               ), Positioned(
//                                                   top: 146.80010986328125,
//                                                   left: 187.95199584960938,
//                                                   child: SvgPicture.asset(
//                                                       'assets/images/vector.svg',
//                                                       semanticsLabel: 'vector'
//                                                   )
//                                               ),
//                                             ]
//                                         )
//                                     )
//                                 ),
//                               ]
//                           )
//                       )
//                   ), Positioned(
//                       top: 83,
//                       left: 0,
//                       child: Container(
//                           width: 375,
//                           height: 241,
//                           decoration: BoxDecoration(
//                             color: Color.fromRGBO(197, 59, 64, 1),
//                           ),
//                           child: Stack(
//                               children: <Widget>[
//                                 Positioned(
//                                     top: 0,
//                                     left: 0,
//                                     child: Container(
//                                         width: 375,
//                                         height: 241,
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(65, 65, 65, 1),
//                                         )
//                                     )
//                                 ), Positioned(
//                                     top: 1,
//                                     left: 0,
//                                     child: Container(
//                                         width: 188,
//                                         height: 240,
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                               image: AssetImage(
//                                                   'assets/images/Image21.png'),
//                                               fit: BoxFit.fitWidth
//                                           ),
//                                         )
//                                     )
//                                 ), Positioned(
//                                     top: 93,
//                                     left: 212,
//                                     child: Text('Beats Solo3 Wireless'
//                                       , textAlign: TextAlign.left, style: TextStyle(
//                                           color: Color.fromRGBO(255, 255, 255, 1),
//                                           fontFamily: 'Avenir',
//                                           fontSize: 26,
//                                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                                           fontWeight: FontWeight.normal,
//                                           height: 1
//                                       ),)
//                                 ), Positioned(
//                                     top: 170,
//                                     left: 214,
//                                     child: Text(
//                                       '€319.90', textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                           color: Color.fromRGBO(255, 255, 255, 1),
//                                           fontFamily: 'Avenir',
//                                           fontSize: 16,
//                                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                                           fontWeight: FontWeight.normal,
//                                           height: 1
//                                       ),)
//                                 ), Positioned(
//                                     top: 76,
//                                     left: 213,
//                                     child: Text(
//                                       'Beats by Dre', textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                           color: Color.fromRGBO(255, 255, 255, 1),
//                                           fontFamily: 'Avenir',
//                                           fontSize: 10,
//                                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                                           fontWeight: FontWeight.normal,
//                                           height: 1
//                                       ),)
//                                 ),
//                               ]
//                           )
//                       )), Positioned(
//                       top: 305,
//                       left: 180,
//                       child: Container(
//                           width: 16,
//                           height: 5,
//
//                           child: Stack(
//                               children: <Widget>[
//                                 Positioned(
//                                     top: 0,
//                                     left: 11,
//                                     child: Container(
//                                         width: 5,
//                                         height: 5,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(90),
//                                             topRight: Radius.circular(90),
//                                             bottomLeft: Radius.circular(90),
//                                             bottomRight: Radius.circular(90),
//                                           ),
//                                           color: Color.fromRGBO(255, 255, 255, 0.5),
//                                         )
//                                     )
//                                 ), Positioned(
//                                     top: 0,
//                                     left: 0,
//                                     child: Container(
//                                         width: 5,
//                                         height: 5,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(90),
//                                             topRight: Radius.circular(90),
//                                             bottomLeft: Radius.circular(90),
//                                             bottomRight: Radius.circular(90),
//                                           ),
//                                           color: Color.fromRGBO(255, 255, 255, 1),
//                                         )
//                                     )
//                                 ),
//                               ]
//                           )
//                       )
//                   ),
//                    Positioned(
//                       top: 0,
//                       left: -188,
//                       child: SvgPicture.asset(
//                           'assets/images/rectangle41.svg',
//                           semanticsLabel: 'rectangle41'
//                       )
//                   ), Positioned(
//                       top: 0,
//                       left: 375,
//                       child: SvgPicture.asset(
//                           'assets/images/rectangle42.svg',
//                           semanticsLabel: 'rectangle42'
//                       )
//                   ),
//                 ]
//             )
//         ),
//       ),
//     );
//   }
// }

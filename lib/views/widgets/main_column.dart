// import 'package:flutter/material.dart';
// import 'package:tec_tac_toe_game/models/player.dart';
// import 'package:tec_tac_toe_game/models/point.dart';
// import 'package:tec_tac_toe_game/views/widgets/element_x_o.dart';
// import 'package:tec_tac_toe_game/utils/app_colors.dart';

// class MainColumn extends StatefulWidget {
//   final List<List<SymbolXO>> lnew;
//   final List<ValueListenableBuilder> ll;
//   final List<List<ValueListenableBuilder>> l;
//   final Point p;
//   final List<Player> llnew;

//   const MainColumn(
//       {super.key,
//       required this.lnew,
//       required this.ll,
//       required this.l,
//       required this.p,
//       required this.llnew});

//   @override
//   State<MainColumn> createState() => _MainColumnState();
// }

// class _MainColumnState extends State<MainColumn> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             widget.ll[0],
//             const Spacer(),
//             widget.ll[1],
//           ],
//         ),
//         GridView.count(
//           shrinkWrap: true,
//           crossAxisCount: 3,
//           children: widget.l
//               .map((e) => e.map((e1) => e1))
//               .expand((element) => element)
//               .toList(),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 50,
//                 width: 160,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: AppColor.Green,
//                 ),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: const Center(
//                     child: Text("RESET SCORE"),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               Container(
//                 height: 50,
//                 width: 160,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: AppColor.red,
//                 ),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: const Center(
//                     child: Text("PLAY AGAIN"),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

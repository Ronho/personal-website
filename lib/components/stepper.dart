// import 'package:flutter/material.dart';
//
// import 'package:personal_website/components/stepper_item.dart';
//
// class AnotherStepper extends StatelessWidget {
//   const AnotherStepper({
//     Key? key,
//     required this.stepperList,
//     this.gap = 40,
//     this.activeIndex = 0,
//     required this.horizontalStepperHeight,
//     required this.stepperDirection,
//     this.inverted = false,
//     this.activeBarColor = Colors.blue,
//     this.inActiveBarColor = Colors.grey,
//     this.barThickness = 2,
//     this.dotWidget,
//     this.titleTextStyle = const TextStyle(
//       fontSize: 14,
//       color: Colors.black,
//       fontWeight: FontWeight.w600,
//     ),
//     this.subtitleTextStyle = const TextStyle(
//       fontSize: 12,
//       color: Colors.grey,
//       fontWeight: FontWeight.w500,
//     ),
//     this.scrollPhysics,
//   }) : super(key: key);
//
//   final List<StepperData> stepperList;
//   final double gap;
//   final int activeIndex;
//   final double horizontalStepperHeight;
//   final Axis stepperDirection;
//   final bool inverted;
//   final Color activeBarColor;
//   final Color inActiveBarColor;
//   final double barThickness;
//   final Widget? dotWidget;
//   final TextStyle titleTextStyle;
//   final TextStyle subtitleTextStyle;
//   final ScrollPhysics? scrollPhysics;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height:
//             stepperDirection == Axis.horizontal ? horizontalStepperHeight : null,
//         child: ListView.builder(
//             shrinkWrap: true,
//             physics: scrollPhysics ?? const AlwaysScrollableScrollPhysics(),
//             itemCount: stepperList.length,
//             padding: EdgeInsets.zero,
//             scrollDirection: stepperDirection,
//             itemBuilder: (ctx, index) {
//               if (index <= 1) {
//                 return StepperItem(
//                   index: index,
//                   item: stepperList[index],
//                   totalLength: stepperList.length,
//                   gap: gap,
//                   activeIndex: activeIndex,
//                   isInverted: inverted,
//                   inActiveBarColor: inActiveBarColor,
//                   activeBarColor: activeBarColor,
//                   barWidth: barThickness,
//                   dotWidget: dotWidget,
//                   titleTextStyle: titleTextStyle,
//                   subtitleTextStyle: subtitleTextStyle,
//                 );
//               } else {
//                 return SubStepperItem(
//                   index: index,
//                   item: stepperList[index],
//                   totalLength: stepperList.length,
//                   gap: gap,
//                   activeIndex: activeIndex,
//                   isInverted: inverted,
//                   inActiveBarColor: inActiveBarColor,
//                   activeBarColor: activeBarColor,
//                   barWidth: barThickness,
//                   dotWidget: dotWidget,
//                   titleTextStyle: titleTextStyle,
//                   subtitleTextStyle: subtitleTextStyle,
//                 );
//               }
//             }),
//       ),
//     );
//   }
// }

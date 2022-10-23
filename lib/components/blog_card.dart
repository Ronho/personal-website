import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class BlogCard extends StatefulWidget {
  final int numLines;
  const BlogCard({Key? key, required this.numLines}) : super(key: key);

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat.yMMMd().format(DateTime.now());

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 10.0,
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: constraints.maxHeight / 16 * 9,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/thumbnails/thumbnail.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$date • My Headline Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut",
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                      maxLines: widget.numLines,
                      softWrap: true,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        color: Color.fromRGBO(170, 170, 170, 1),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// const SizedBox(height: 8),
// Row(
//   children: [
//     const Text(
//       "Tools:",
//       maxLines: 1,
//       style: TextStyle(
//         overflow: TextOverflow.ellipsis,
//         fontSize: 12,
//         color: Color.fromRGBO(170, 170, 170, 1),
//       ),
//     ),
//     const SizedBox(width: 8),
//     Expanded(
//       child: ScrollConfiguration(
//         behavior: MyCustomScrollBehavior(),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: const [
//               Chip(
//                 label: Text("Flutter"),
//                 labelStyle: TextStyle(fontSize: 12),
//               ),
//               SizedBox(width: 8),
//               Chip(
//                 label: Text("Flutter"),
//                 labelStyle: TextStyle(fontSize: 12),
//               ),
//               SizedBox(width: 8),
//               Chip(
//                 label: Text("Flutter"),
//                 labelStyle: TextStyle(fontSize: 12),
//               ),
//               SizedBox(width: 8),
//               Chip(
//                 label: Text("Flutter"),
//                 labelStyle: TextStyle(fontSize: 12),
//               ),
//               SizedBox(width: 8),
//               Chip(
//                 label: Text("Flutter"),
//                 labelStyle: TextStyle(fontSize: 12),
//               ),
//               SizedBox(width: 8),
//               Chip(
//                 label: Text("Flutter"),
//                 labelStyle: TextStyle(fontSize: 12),
//               ),
//               SizedBox(width: 8),
//               Chip(
//                 label: Text("Flutter"),
//                 labelStyle: TextStyle(fontSize: 12),
//               ),
//               SizedBox(width: 8),
//               Chip(
//                 label: Text("Flutter"),
//                 labelStyle: TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),

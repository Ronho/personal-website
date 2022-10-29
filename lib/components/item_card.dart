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

class ItemCard extends StatefulWidget {
  final int numLines;
  final String coverPath;
  final String title;
  final String summary;
  final DateTime date;
  final void Function() onClick;
  const ItemCard(
      {Key? key,
      required this.numLines,
      required this.coverPath,
      required this.title,
      required this.summary,
      required this.date,
      required this.onClick})
      : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    final String date = DateFormat.yMMMd().format(widget.date);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: widget.onClick,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: constraints.maxWidth / 16 * 9,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                      image: AssetImage(widget.coverPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$date • ${widget.title}",
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
                      widget.summary,
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
              ],
            ),
          ),
        );
      },
    );
  }
}

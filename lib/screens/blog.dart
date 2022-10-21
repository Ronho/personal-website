import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_website/components/nav_bar.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: List.generate(10, (index) {
            return Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 500,
                height: 450,
                child: Card(
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
                        height: 265,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/thumbnails/thumbnail.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "My Headline Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut",
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                              maxLines: 3,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                color: Color.fromRGBO(170, 170, 170, 1),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text(
                                  "Tools:",
                                  maxLines: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                    color: Color.fromRGBO(170, 170, 170, 1),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ScrollConfiguration(
                                    behavior: MyCustomScrollBehavior(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: const [
                                          Chip(
                                            label: Text("Flutter"),
                                            labelStyle: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 8),
                                          Chip(
                                            label: Text("Flutter"),
                                            labelStyle: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 8),
                                          Chip(
                                            label: Text("Flutter"),
                                            labelStyle: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 8),
                                          Chip(
                                            label: Text("Flutter"),
                                            labelStyle: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 8),
                                          Chip(
                                            label: Text("Flutter"),
                                            labelStyle: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 8),
                                          Chip(
                                            label: Text("Flutter"),
                                            labelStyle: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 8),
                                          Chip(
                                            label: Text("Flutter"),
                                            labelStyle: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 8),
                                          Chip(
                                            label: Text("Flutter"),
                                            labelStyle: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          // Container(
          //   decoration: BoxDecoration(
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.1),
          //         spreadRadius: 5,
          //         blurRadius: 5,
          //         offset: const Offset(5, 10),
          //       ),
          //     ],
          //   ),
          //   child: Wrap(
          //     children: [
          //       Column(
          //         children: [
          //           ClipRRect(
          //             borderRadius: const BorderRadius.only(
          //               topLeft: Radius.circular(20),
          //               topRight: Radius.circular(20),
          //             ),
          //             child: Image.asset(
          //               width: MediaQuery.of(context).size.width / 3,
          //               'assets/images/thumbnails/thumbnail.jpg',
          //             ),
          //           ),
          //           Container(
          //             width: MediaQuery.of(context).size.width / 3,
          //             height: MediaQuery.of(context).size.height / 6,
          //             decoration: const BoxDecoration(
          //               color: Color.fromRGBO(64, 64, 64, 1),
          //               borderRadius: BorderRadius.only(
          //                 bottomLeft: Radius.circular(20),
          //                 bottomRight: Radius.circular(20),
          //               ),
          //             ),
          //             child: const Text("He'd have you all unravel at the"),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // );

          // <Widget>[
          //   Container(
          //     padding: const EdgeInsets.all(8),
          //     color: Colors.teal[100],
          //     child: const Text("He'd have you all unravel at the"),
          //   ),
          //   Container(
          //     padding: const EdgeInsets.all(8),
          //     color: Colors.teal[200],
          //     child: const Text('Heed not the rabble'),
          //   ),
          //   Container(
          //     padding: const EdgeInsets.all(8),
          //     color: Colors.teal[300],
          //     child: const Text('Sound of screams but the'),
          //   ),
          //   Container(
          //     padding: const EdgeInsets.all(8),
          //     color: Colors.teal[400],
          //     child: const Text('Who scream'),
          //   ),
          //   Container(
          //     padding: const EdgeInsets.all(8),
          //     color: Colors.teal[500],
          //     child: const Text('Revolution is coming...'),
          //   ),
          //   Container(
          //     padding: const EdgeInsets.all(8),
          //     color: Colors.teal[600],
          //     child: const Text('Revolution, they...'),
          //   ),
          // ],
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

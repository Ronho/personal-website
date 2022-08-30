import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  const NavButton({Key? key}) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool hover = false;
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            color = Colors.black;
          });
        },
        onExit: (event) {
          setState(() {
            color = Colors.white;
          });
        },
        child: Row(
          children: [
            Icon(
              Icons.home,
              color: color,
            ),
            const SizedBox(width: 8),
            Text(
              'Home',
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String name;
  final IconData icon;
  final bool isActive;
  final void Function() onClick;

  const NavButton({
    Key? key,
    required this.name,
    required this.onClick,
    required this.icon,
    required this.isActive,
  }) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton>
    with SingleTickerProviderStateMixin {
  bool hover = false;

  late Animation<Color?> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    animation = ColorTween(begin: Colors.grey[500], end: Colors.grey[100])
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  void animateColor() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            controller.forward();
          });
        },
        onExit: (event) {
          setState(() {
            controller.reverse();
          });
        },
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: widget.isActive ? Colors.grey[100] : animation.value,
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: TextStyle(
                color: widget.isActive ? Colors.grey[100] : animation.value,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

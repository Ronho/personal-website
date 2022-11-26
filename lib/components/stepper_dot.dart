import 'package:flutter/material.dart';

class SubStepperDot extends StatelessWidget {
  final double size;
  const SubStepperDot({
    Key? key,
    required this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
      ),
    );
  }
}

class StepperDot extends StatelessWidget {
  final double size;
  const StepperDot({
    Key? key,
    required this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 3,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
      ),
      child: Container(
        height: size/2,
        width: size/2,
        margin: EdgeInsets.all(size/6),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(size),
          ),
        ),
      ),
    );
  }
}
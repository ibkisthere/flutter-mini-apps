import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({this.isActive = false, super.key});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
          color: isActive ? Color(0xFF053149) : Colors.black54,
          border: isActive ? null : Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

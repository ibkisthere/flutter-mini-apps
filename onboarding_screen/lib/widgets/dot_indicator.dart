import 'package:flutter/material.dart';

AnimatedContainer buildDots({int? index, int? currentPage}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
      color: Color(0xFF000000),
    ),
    margin: const EdgeInsets.only(right: 5),
    height: 10,
    curve: Curves.easeIn,
    width: currentPage == index ? 20 : 10,
  );
}


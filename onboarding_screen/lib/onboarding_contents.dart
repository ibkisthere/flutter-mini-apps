import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String description;

  OnboardingContents(
      {required this.title, required this.image, required this.description});
}

List<OnboardingContents> contents = [
  OnboardingContents(
      title: "Track your work and get the result",
      image: "assets/images/image1.png",
      description: "Remember to keep track of your professional accomplishments"),
  OnboardingContents(
    title: "Stay organized with team",
    image: "assets/images/image2.png",
    description:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "assets/images/image3.png",
    description:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];

class OnBoardContent extends StatelessWidget {
 const OnBoardContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          title, style: const TextStyle(
            color: Color(0xFF053149),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF053149),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        Spacer(),
        Image.asset(
          image,
          fit: BoxFit.fitHeight,
        ),
        Spacer(),
      ],
    );
  }
}

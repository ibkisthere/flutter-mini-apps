import 'package:flutter/material.dart';
// import 'dart:async';

import 'package:onboarding_screen/onboarding_contents.dart';
import 'package:onboarding_screen/widget/dot_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  final Color kDarkBlueColor = const Color(0xFF053149);
  // Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
    // _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
    //   if (_pageIndex < contents.length - 1) {
    //     setState(() {
    //       _pageIndex++;
    //     });
    //     print(_pageIndex);
    //   } else {
    //     setState(() {
    //       _pageIndex = 0;
    //     });
    //   }
    //   _pageController.animateToPage(_pageIndex,
    //       duration: const Duration(milliseconds: 35), curve: Curves.easeInOut);
    // });
  }

  @override
  void dispose() {
    _pageController.dispose();
    // _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    void _goToNextPage() {
      print('hello');
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _goToNextPage,
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.black26,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white24,
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    onPageChanged: (value) {
                      // update the dots indicator
                      setState(() {
                        _pageIndex = value;
                      });
                    },
                    itemCount: contents.length,
                    controller: _pageController,
                    itemBuilder: (context, index) => OnBoardContent(
                        image: contents[index].image,
                        title: contents[index].title,
                        description: contents[index].description))),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      contents.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),
                ],
              ),
            ),
            const Text("By proceeding agree to our privacy policy"),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height:100,
              child:
            _pageIndex == contents.length - 1 ? 
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 48),
                  height: size.height * 0.05,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Login/Registration",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ) : SizedBox.shrink()
            )
          ],
        ),
      ),
    );
  }
}

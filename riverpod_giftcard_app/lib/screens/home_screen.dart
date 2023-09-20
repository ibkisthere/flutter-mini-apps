import 'package:flutter/material.dart';
import 'package:riverpod_giftcard_app/gen/fonts.gen.dart';
import 'package:riverpod_giftcard_app/widgets/apptext.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left:10.0),
          child:AppText.title('Gift Card'),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
    ),
    body: Column(children: [],)
  );
  }
}

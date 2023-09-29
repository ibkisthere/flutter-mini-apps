import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_timer_app/timer.dart';
import 'dart:math';
void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TimerPage()
    );
  }
}




//https://medium.com/flutter-community/flutter-riverpod-tutorial-timer-app-186d04637775



class TimerPage extends ConsumerWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final streamCount = ref.watch(timer);
    String twoDigits(int n) => n.toString().padLeft(2,"0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String hours = twoDigits(duration.inHours);
    final _backGroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Scaffold(
      backgroundColor: _backGroundColor,
      appBar: AppBar(
        title: Text("Timer App"),
      ),
      body: Column(
        children: [
          streamCount.when(
          data: (value) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 40,right: 40,top:50,bottom: 20),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 5
                )
              ),
              child: Text(
                "$hours:$minutes:$seconds",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40
                )
              ),
            );
          }, 
          error: (error,stacktrace) => Text(error.toString()), 
          loading: () => Center(child: CircularProgressIndicator(color: Colors.black,),)
          )
        ],
      ),
    );
  }
}
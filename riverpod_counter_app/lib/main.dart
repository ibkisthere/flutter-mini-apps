import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter_app/counter.dart';

//create a provider
final counter = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(child: const MyApp()));
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterProvider = ref.watch(counter);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('My counter App'),
        ),
        body:  Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'Simple Counter',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            Text(
              counterProvider.toString(),
              style: TextStyle(color: Colors.black, height: 5, fontSize: 23),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.add), 
                    label: Text('Add'),
                    onPressed: ()=> ref.watch(counter.notifier).state++
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.remove), 
                    label: Text('Minus'),
                    onPressed: ()=> ref.watch(counter.notifier).state--
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: ()=> ref.watch(counter.notifier).state = 0, 
              icon: Icon(Icons.replay),
              label: Text('refresh')
            )
          ],
        )));
  }
}

//https://clouds.hashnode.dev/the-ultimate-guide-to-mastering-riverpod-for-flutter-beginners
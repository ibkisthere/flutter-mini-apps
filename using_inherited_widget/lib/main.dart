import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
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
        ),
        home: ApiProvider(api: Api(), child: MyHomePage()));
  }
}

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiProvider.of(context).api;

    return Text(api.dateAndTime ?? 'Tap on the screen to fetch date and time');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueKey _textKey = const ValueKey<String?>(null);

  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(ApiProvider.of(context).api.dateAndTime ?? ''),
        ),
        body: GestureDetector(
          onTap: () async {
            final api = ApiProvider.of(context).api;
            final dateAndTime = await api.getDateAndTime();
            // because we are updating the _textkey, the widget is now dirty, marked for a rebuild 
            setState(() {
              _textKey = ValueKey(dateAndTime);
            });
          },
          child: SizedBox.expand(
            child: Container(
              color: Colors.white,
              child: DateTimeWidget(key: _textKey),
            ),
          ),
        ));
  }
}

class ApiProvider extends InheritedWidget {
  final Api api;
  final String uuid;

  ApiProvider({
    Key? key,
    required this.api,
    required Widget child,
  })  : uuid = const Uuid().v4(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) {
    return uuid != oldWidget.uuid;
  }

  static ApiProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiProvider>()!;
  }
}

// hybrid of stateful and statelss widget with more control
class Api {
  String? dateAndTime;

  Future<String> getDateAndTime() {
    return Future.delayed(
            Duration(seconds: 1), () => DateTime.now().toIso8601String())
        .then((value) {
      dateAndTime = value;
      return value;
    });
  }
}

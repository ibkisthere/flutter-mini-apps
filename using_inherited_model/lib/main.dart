import 'package:flutter/material.dart';
import 'dart:math' show Random;
import 'dart:developer' as devtools show log;

// inheritedModel allows us to redraw only relevant parts of our widget tree
// Descendants of an inheritedModel can be notified of specific changes
// they can listen to an aspect of your inheritedModel
// here are all you descendant and what properties they have listened to
// take these properties and decide which properties have to be redrawn
void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var color1 = Colors.yellow;
  var color2 = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AvailableColorsWidget(
          color1: color1,
          color2: color2,
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          color1 = colors.getRandomElement();
                        });
                      },
                      child: const Text('Change color1')),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          color2 = colors.getRandomElement();
                        });
                      },
                      child: const Text('Change color2')),
                ],
              ),
              const ColorWidget(color: AvailableColors.one),
              const ColorWidget(color: AvailableColors.two)
            ],
          )),
    );
  }
}
//we use this enum as aspects of our inheritedModel , inheritedmodel is going to allow you to listen to whether a specific aspect of the inheritedModel changes , but how do these widgets know what they are going to lsiten to they do that by having an enumeration called AvilableColors

enum AvailableColors { one, two }

class AvailableColorsWidget extends InheritedModel<AvailableColors> {
  final MaterialColor color1;
  final MaterialColor color2;

  AvailableColorsWidget(
      {Key? key,
      required this.color1,
      required this.color2,
      required Widget child})
      : super(key: key, child: child);

  static AvailableColorsWidget of(
      BuildContext context, AvailableColors aspect) {
    return InheritedModel.inheritFrom<AvailableColorsWidget>(context,
        aspect: aspect)!;
  }

  @override
  bool updateShouldNotify(covariant AvailableColorsWidget oldWidget) {
    // if thecolor1 is not hte same a the oldcolor1 somehting has changed
    // basically we are saying everytime this function gets called i want to see that
    devtools.log('updateShouldNotify');
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
    //Flutter decides whether any descendant has to be rebuilt by calling updateShouldNotify
  }

  @override
  bool updateShouldNotifyDependent(covariant AvailableColorsWidget oldWidget,
      Set<AvailableColors> dependencies) {
    devtools.log('updateShouldNotifyDependent');
    if (dependencies.contains(AvailableColors.one) &&
        color1 != oldWidget.color1) {
      return true;
    }
    if (dependencies.contains(AvailableColors.two) &&
        color2 != oldWidget.color2) {
      return true;
    }
    return false;
  }

  // !  - is to force unwrap a value
  // if updateShouldNotify() returns true , then flutte calls updateShouldNotifyDependent
  //this partcular widget is now interested in this particular aspect of the Inherited Model and that creates the dependency so if that updateSHouldNotifyUpdate is true it comes to updateShouldNotifyDependent and passes that depdency inside the set
}

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}

final List<MaterialColor> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.indigo,
  Colors.brown,
];

class ColorWidget extends StatelessWidget {
  final AvailableColors color;

  const ColorWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    switch (color) {
      case AvailableColors.one:
        devtools.log('Color1 widget got rebuilt');
        break;
      case AvailableColors.two:
        devtools.log('Color2 widget got rebuilt');
        break;
    }
    // to get a copy of the provider we use the of function
    final provider = AvailableColorsWidget.of(context, color);
    return Container(
        height: 100,
        color:
            color == AvailableColors.one ? provider.color1 : provider.color2);
  }
}

// how does it work ?
// we clicked color1, it changed, setState was called, the stateFulWidget tried to rebuild its children but it doesn't know which one to rebuild then flutter understood that the widget that owns all the other widgets is an InheritedModel so it then called updateShouldNotify int eh inheritedModel then we compare  flutter SDK is keeping a copy of the previous instance whne it returns true, that comsthing did change , it then called updateShouldNotifyDependent devtools logs , in this fn , we say if any of our dependents are dependent on colour1 , and that color has changed, then it needs to be rebuilt 

// inheritedModel and inheriteWidget are stateless they don't have state they get state from outside , a stateful widget , so it contains a value and passes it down to your inheriteModel or inheritedWidget 
import 'package:flutter/material.dart';
import 'package:navigator_2_async/Variables.dart';
import 'package:navigator_2_async/router/MyRouterState.dart';

class PageThreeRoute extends Page {
  PageThreeRoute() : super(key: ValueKey("PageThree"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (BuildContext context) => PageThree(),
      settings: this,
    );
  }
}

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => PageThreeState();
}

class PageThreeState extends State<PageThree> {

  @override
  void initState() {
    print("Init Page Three");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Three"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Variables.getIt<MyRouterState>().update(two: false, one: true, three: false);
              },
              child: const Text("Page One"),
            ),
            ElevatedButton(
              onPressed: () {
                Variables.getIt<MyRouterState>().update(two: true, one: false, three: false);
              },
              child: const Text("Page Two"),
            ),
          ],
        ),
      ),
    );
  }
}

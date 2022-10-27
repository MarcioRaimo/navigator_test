import 'package:flutter/material.dart';
import 'package:navigator_2_async/Variables.dart';
import 'package:navigator_2_async/router/MyRouterState.dart';

class PageTwoRoute extends Page {
  PageTwoRoute() : super(key: ValueKey("PageTwo"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (BuildContext context) => PageTwo(),
      settings: this,
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {

  @override
  void initState() {
    print("Init Page Two // class PageTwo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Two"),
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
                Variables.getIt<MyRouterState>().update(two: false, one: false, three: true);
              },
              child: const Text("Page Three"),
            ),
          ],
        ),
      ),
    );
  }
}

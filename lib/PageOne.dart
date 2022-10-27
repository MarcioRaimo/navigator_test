import 'package:flutter/material.dart';
import 'package:navigator_2_async/Variables.dart';
import 'package:navigator_2_async/router/MyRouterState.dart';

class PageOneRoute extends Page {
  PageOneRoute() : super(key: ValueKey("PageOne"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (BuildContext context) => PageOne(),
      settings: this,
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => PageOneState();
}

class PageOneState extends State<PageOne> {
  @override
  void initState() {
    print("Init Page One");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page One"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Variables.getIt<MyRouterState>().update(two: true, one: false, three: false);
              },
              child: const Text("Page Two"),
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

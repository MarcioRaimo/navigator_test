import 'package:flutter/material.dart';
import 'package:navigator_2_async/PageOne.dart';
import 'package:navigator_2_async/Variables.dart';
import 'package:navigator_2_async/router/MyRouteInformationParser.dart';
import 'package:navigator_2_async/router/MyRouterDelegate.dart';

void main() {
  Variables.initVariables();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyRouteInformationParser parser;
  late MyRouterDelegate delegate;

  @override
  void initState() {
    super.initState();
    parser = MyRouteInformationParser();
    delegate = MyRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: delegate,
      routeInformationParser: parser,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}

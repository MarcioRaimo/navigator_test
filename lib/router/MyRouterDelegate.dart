import 'package:flutter/material.dart';
import 'package:navigator_2_async/PageOne.dart';
import 'package:navigator_2_async/PageThree.dart';
import 'package:navigator_2_async/PageTwo.dart';
import 'package:navigator_2_async/Variables.dart';
import 'package:navigator_2_async/router/MyRouterState.dart';

class MyRouterDelegate extends RouterDelegate<MyRouterState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRouterState> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  MyRouterState state = MyRouterState();

  List<Page> get oneStack {
    return [
      PageOneRoute()
    ];
  }

  List<Page> get twoStack {
    return [
      PageTwoRoute()
    ];
  }

  List<Page> get threeStack {
    return [
      PageThreeRoute()
    ];
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  MyRouterDelegate() {
    print("Construct RouterDelegate // class MyRouterDelegate");
    Variables.getIt<MyRouterState>().addListener(update);
  }

  void update() {
    state = Variables.getIt<MyRouterState>();
    notifyListeners();
  }

  @override
  MyRouterState? get currentConfiguration {
    print("Enter getCurrentConfiguration // class MyRouterDelegate");
    return state;
  }

  @override
  Future<void> setNewRoutePath(MyRouterState configuration) async {
    print("Enter setNewRoutePath // class MyRouterDelegate");
    print(configuration.toString());
    state.updateWithInstance(configuration);
  }

  @override
  Widget build(BuildContext context) {
    print("Build RouterDelegate // class MyRouterDelegate");
    List<Page> stack = [];
    if (state.isOne == true) {
      stack = oneStack;
    }
    if (state.isTwo == true) {
      stack = twoStack;
    }
    if (state.isThree == true) {
      stack = threeStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        print("onPopPage, ${route.settings.name}");
        if (!route.didPop(result)) {
          return false;
        }
        return true;
      },
    );
  }
}

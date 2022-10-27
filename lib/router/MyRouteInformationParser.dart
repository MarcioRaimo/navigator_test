import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:navigator_2_async/router/MyRouterState.dart';

class MyRouteInformationParser extends RouteInformationParser<MyRouterState> {
  @override
  Future<MyRouterState> parseRouteInformation (RouteInformation routeInformation) async {
    print("Enter parseRouteInformation");
    final uri = Uri.parse(routeInformation.location!);
    MyRouterState state = MyRouterState();
    print(uri.pathSegments);
    if (uri.pathSegments.isEmpty) {
      print("Before http request");
      final response = await Dio().get<List<dynamic>>('https://jsonplaceholder.typicode.com/posts');
      print("After http request");
      if (response.data!.isNotEmpty) {
        state.isOne = false;
        state.isTwo = true;
      }
    }
    return state;
  }

  @override
  RouteInformation? restoreRouteInformation(MyRouterState configuration) {
    print("Enter restoreRouteInformation");
    print(configuration.toString());
    if (configuration.isThree) {
      return const RouteInformation(location: '/three');
    }
    if (configuration.isTwo) {
      return const RouteInformation(location: '/two');
    }
    if (configuration.isOne) {
      return const RouteInformation(location: '/one');
    }
    return null;
  }
}
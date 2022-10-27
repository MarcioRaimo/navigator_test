import 'package:get_it/get_it.dart';
import 'package:navigator_2_async/router/MyRouterState.dart';

class Variables {
  static late GetIt getIt;

  static initVariables() {
    getIt = GetIt.instance;
    getIt.registerSingleton<MyRouterState>(MyRouterState());
  }
}
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

import './k_route.dart';

class KRouter {
  KRouter._internal();

  factory KRouter() => _instance;
  static final KRouter _instance = KRouter._internal();

  List<KRoute> _routes = [];

  void registerRoute({required KRoute route}) {
    this._routes.add(route);
  }

  String getInitialRouteName() {
    try {
      return _routes.firstWhere((element) => element.isInitial).name;
    } catch (error) {
      return "/";
    }
  }

  Map<String, Widget Function(BuildContext)> getApplicationRoutes() {
    Map<String, Widget Function(BuildContext)> parsedRoutes = {};
    for (final KRoute route in this._routes) {
      parsedRoutes.addAll({route.name: (context) => route.page});
    }
    return parsedRoutes;
  }

  Future<T?> push<T>(String name, {Map<String, dynamic>? args}) {
    return Okito.pushNamed(name, arguments: args);
  }

  void pop<T extends Object?>([T? result]) {
    return Navigator.of(Okito.context!).pop();
  }
}

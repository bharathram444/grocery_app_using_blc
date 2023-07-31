import 'package:flutter/material.dart';

class MyNavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  void goBack() => navigatorKey.currentState?.pop();
}
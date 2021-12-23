import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/router/router_demo.dart';

class Routers {
  static final FluroRouter _router = FluroRouter();

  static init() {
    _router.notFoundHandler = Handler(handlerFunc: (_, Map<String, dynamic> parameters) {});
    _router.define(routerPathA, handler: Handler(handlerFunc: (_, Map<String, dynamic> params) {
      return RouterPageA(params: params);
    }));
    _router.define(routerPathB, handler: Handler(handlerFunc: (_, Map<String, dynamic> params) {
      return RouterPageB(params: params);
    }));
    _router.define(routerPathC, handler: Handler(handlerFunc: (_, Map<String, dynamic> params) {
      return RouterPageC(params: params);
    }));
  }

  static final _globalPrams = {};

  static void setGlobalPrams(Map<String, dynamic> params) {
    _globalPrams.clear();
    _globalPrams.addAll(params);
  }

  static void addGlobalPrams(Map<String, dynamic> params) {
    _globalPrams.addAll(params);
  }

  static Future navigateTo(
    BuildContext context,
    String path, {
    Map<String, dynamic>? params,
    bool replace = false,
    bool clearStack = false,
    bool maintainState = true,
    bool rootNavigator = false,
    TransitionType? transition,
    Duration? transitionDuration,
    RouteTransitionsBuilder? transitionBuilder,
    RouteSettings? routeSettings,
  }) {
    final realPath = _rebuildPathWithParams(path, params);
    return _router.navigateTo(
      context,
      realPath,
      replace: replace,
      clearStack: clearStack,
      maintainState: maintainState,
      rootNavigator: rootNavigator,
      transition: transition,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      routeSettings: routeSettings,
    );
  }

  static String _rebuildPathWithParams(String path, Map<String, dynamic>? params) {
    final _innerParams = {};
    _innerParams.addAll(_globalPrams);
    if (params != null && params.isNotEmpty) {
      _innerParams.addAll(params);
    }
    if (_innerParams.isEmpty) return path;
    bool symbol = true;
    StringBuffer buffer = StringBuffer(path);
    for (var key in _innerParams.keys) {
      if (symbol && !path.contains("?")) {
        symbol = false;
        buffer.write("?");
      } else {
        buffer.write("&");
      }
      buffer.write("$key=${_innerParams[key]}");
    }
    return buffer.toString();
  }

  static void pop<T>(BuildContext context, [T? result]) {
    _router.pop(context, result);
  }
}

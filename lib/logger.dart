// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Log {
  static void info(dynamic object, String msg) {
    String tag;
    if (object is Widget) {
      tag = object.runtimeType.toString();
    } else if (object is State) {
      tag = object.widget.runtimeType.toString();
    } else {
      tag = object.toString();
    }
    tag = tag.replaceFirst("_", "");
    print("$tag(0x${object.hashCode.toRadixString(16)}) -> $msg");
  }
}

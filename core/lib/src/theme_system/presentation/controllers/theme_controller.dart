import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ThemeController extends CustomController<Exception, ThemeMode> {
  ThemeController() : super(ThemeMode.light);

  Future<void> changeTheme() async {
    update((state == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light);
  }
}

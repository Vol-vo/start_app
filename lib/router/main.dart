import 'dart:async';

import 'package:flutter/material.dart';
import '../logger.dart';
import 'StartApp.dart';
void main() {
  runZonedGuarded(() => runApp(const StartApp()), (error, stack) {
    logger.e(error, error: error, stackTrace: stack);
  });
}
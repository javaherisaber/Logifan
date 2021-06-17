import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ContextExtensions on BuildContext {
  /// Typography for textStyle used in [Text] widget
  TextTheme typography() {
    return Theme.of(this).textTheme;
  }

  /// Arguments received between two Navigation destination
  Object arguments() {
    return ModalRoute.of(this)!.settings.arguments!;
  }
}
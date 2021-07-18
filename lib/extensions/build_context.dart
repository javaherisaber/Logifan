import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intlLib;

extension ContextExtensions on BuildContext {
  /// Typography for textStyle used in [Text] widget
  TextTheme get typography => Theme.of(this).textTheme;

  /// Arguments received between two Navigation destination
  Object get arguments => ModalRoute.of(this)!.settings.arguments!;

  TextDirection get textDirectionOfLocale {
    if (this.isRtl) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }

  TextDirection get textDirectionOfContext => Directionality.of(this);

  bool get isRtl => intlLib.Bidi.isRtlLanguage(Localizations.localeOf(this).languageCode);
}
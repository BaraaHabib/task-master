import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_master/app/generated/l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: const [AppLocalizations.delegate,],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        home: widget,
      ),
    );
  }
}

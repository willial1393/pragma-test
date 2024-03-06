import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma/app/app.dart';
import 'package:pragma/injection.dart';

void main() async {
  await runZonedGuarded<Future<void>>(() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    configureDependencies();
    runApp(
      const ProviderScope(
        child: App(),
      ),
    );
  }, (error, stack) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stack);
  });
}

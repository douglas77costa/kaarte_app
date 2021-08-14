import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:hive/hive.dart';
import 'package:kaarte_app/app/app_widget.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runZonedGuarded<Future<void>>(() async {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FirebaseAnalytics analytics = FirebaseAnalytics();
      analytics.setAnalyticsCollectionEnabled(true);
      FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);
      runApp(AppWidget(fireObserver: observer,));
    }, FirebaseCrashlytics.instance.recordError);
  });
}

Future<void> initApp() async {
  await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  await initFirebase();
  await initHive();
}

Future<void> initFirebase() async {
  //Init Analytics
  await Firebase.initializeApp();
  //Init Messaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


}

Future<void> initHive() async {
  if (!kIsWeb) {
    final pathDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(pathDir.path);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

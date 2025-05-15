import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YCycle Petal',
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      home: Scaffold(
        appBar: AppBar(title: Text('YCycle Petal')),
        body: Center(child: Text('Firebase integrado 🎉')),
      ),
    );
  }
}

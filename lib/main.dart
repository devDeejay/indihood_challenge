import 'package:dhananjay_indihood_submission/services/navigation_service.dart';
import 'package:dhananjay_indihood_submission/utils/const.dart';
import 'package:dhananjay_indihood_submission/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:dhananjay_indihood_submission/router/router.dart';

void main() {
  setupDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indihood - DJ',
      theme: ThemeData(
        primaryColor: kBlueColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) => child,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter_Demo',
      routerDelegate: AutoRouterDelegate(
        AppRouter(),
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: AppRouter().defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
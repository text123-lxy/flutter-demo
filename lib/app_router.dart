import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: DetailRoute.page, path: '/detail/:itemId'),
      ];
}
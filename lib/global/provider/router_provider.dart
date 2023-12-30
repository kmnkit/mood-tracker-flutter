import 'package:final_project/constants/routes.dart';
import 'package:final_project/global/screens/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: RoutesConstants.home['path'],
    routes: [
      GoRoute(
        path: RoutesConstants.home['path']!,
        builder: (context, state) {
          return const Home();
        },
      ),
    ],
  );
}

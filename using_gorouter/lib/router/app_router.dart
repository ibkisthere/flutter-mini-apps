import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:using_gorouter/modules/details/details_page.dart';
import 'package:using_gorouter/modules/feed/feed_page.dart';
import 'package:using_gorouter/modules/scaffold_with_navbar/scaffold_with_navbar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/feed',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNavbar(navigationShell);
          },
          branches: [
            StatefulShellBranch(
                navigatorKey: _sectionNavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                      path: '/feed',
                      builder: (context, state) => const FeedPage(),
                      routes: <RouteBase>[
                        GoRoute(
                            path: 'details',
                            builder: (context, state) {
                              return const DetailsPage(
                                label: 'FeedDetails',
                              );
                            })
                      ])
                ]), 
            StatefulShellBranch(
              routes: <RouteBase>[
              GoRoute(
                path: '/shop',
                builder: (context, state) {
                  return const DetailsPage(
                    label: 'Shop',
                  );
                },
              )
            ])
          ])
    ]);

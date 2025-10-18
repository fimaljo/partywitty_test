// lib/core/navigation/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:partywitty_test/features/home/presentation/pages/main_page.dart';

import '../../features/main/presentation/pages/main_page.dart';

import 'route_constants.dart';

class AppRouter {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: RouteConstants.home,
      redirect: (context, state) {
        return null;
      },
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: GlobalKey<NavigatorState>(),
          builder: (context, state, child) {
            return MainPage(child: child);
          },
          routes: [
            GoRoute(
              path: RouteConstants.home,
              name: RouteConstants.homeName,
              builder: (context, state) => HomePage(),
            ),
            GoRoute(
              path: RouteConstants.myBid,
              name: RouteConstants.myBidName,
              builder: (context, state) => Center(child: Text("My Bid")),
            ),
            GoRoute(
              path: RouteConstants.booking,
              name: RouteConstants.bookingName,
              builder: (context, state) => Center(child: Text("Booking")),
            ),
            GoRoute(
              path: RouteConstants.moreItems,
              name: RouteConstants.moreItemsName,
              builder: (context, state) => Center(child: Text("More Items")),
            ),
          ],
        ),
      ],
    );
  }
}

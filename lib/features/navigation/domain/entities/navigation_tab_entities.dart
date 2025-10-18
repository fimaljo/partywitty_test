import 'package:flutter/material.dart';

enum NavigationTab {
  home,
  myBid,
  booking,
  moreItems;

  String get route {
    switch (this) {
      case NavigationTab.home:
        return '/home';
      case NavigationTab.myBid:
        return '/my-bid';
      case NavigationTab.booking:
        return '/booking';
      case NavigationTab.moreItems:
        return '/more-items';
    }
  }

  IconData get icon {
    switch (this) {
      case NavigationTab.home:
        return Icons.home_outlined;
      case NavigationTab.myBid:
        return Icons.gavel_outlined;
      case NavigationTab.booking:
        return Icons.book_online_outlined;
      case NavigationTab.moreItems:
        return Icons.more_horiz_outlined;
    }
  }

  IconData get activeIcon {
    switch (this) {
      case NavigationTab.home:
        return Icons.home;
      case NavigationTab.myBid:
        return Icons.gavel;
      case NavigationTab.booking:
        return Icons.book_online;
      case NavigationTab.moreItems:
        return Icons.more_horiz;
    }
  }

  String get label {
    switch (this) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.myBid:
        return 'My Bid';
      case NavigationTab.booking:
        return 'Booking';
      case NavigationTab.moreItems:
        return 'More';
    }
  }

  static NavigationTab fromRoute(String route) {
    for (final tab in NavigationTab.values) {
      if (route.startsWith(tab.route)) {
        return tab;
      }
    }
    return NavigationTab.home;
  }
}

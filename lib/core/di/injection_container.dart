import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:partywitty_test/core/di/navigation_di.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator(GoRouter router) async {
  sl..registerLazySingleton<GoRouter>(() => router);

  setupNavigationDependencies();

  await _initializeModulesAsync();
}

Future<void> _initializeModulesAsync() async {
  try {
    await Future.wait([
      // HomeModule.init(
      //   sl,
      // ).catchError((e) => debugPrint('Home module init error: $e')),
      // MyBidModule.init(
      //   sl,
      // ).catchError((e) => debugPrint('MyBid module init error: $e')),
      // BookingModule.init(
      //   sl,
      // ).catchError((e) => debugPrint('Booking module init error: $e')),
      // MoreItemsModule.init(
      //   sl,
      // ).catchError((e) => debugPrint('MoreItems module init error: $e')),
    ], eagerError: false);
  } catch (e) {
    debugPrint('Module initialization error: $e');
  }
}

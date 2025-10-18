import 'package:go_router/go_router.dart';
import 'package:partywitty_test/features/navigation/domain/entities/navigation_tab_entities.dart';
import 'package:partywitty_test/features/navigation/domain/repositories/navigation_repository.dart';

class NavigationRepositoryImpl implements NavigationRepository {
  NavigationRepositoryImpl(this.router);
  final GoRouter router;

  @override
  Future<void> navigateToTab(NavigationTab tab) async {
    router.go(tab.route);
  }

  @override
  String getCurrentRoute() {
    return router.routerDelegate.currentConfiguration.last.matchedLocation;
  }
}

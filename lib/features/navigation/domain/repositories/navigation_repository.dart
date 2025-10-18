import 'package:partywitty_test/features/navigation/domain/entities/navigation_tab_entities.dart';

abstract class NavigationRepository {
  Future<void> navigateToTab(NavigationTab tab);
  String getCurrentRoute();
}

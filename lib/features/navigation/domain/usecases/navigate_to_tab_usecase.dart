import 'package:partywitty_test/features/navigation/domain/entities/navigation_tab_entities.dart';
import 'package:partywitty_test/features/navigation/domain/repositories/navigation_repository.dart';

class NavigateToTabUseCase {
  NavigateToTabUseCase(this.repository);
  final NavigationRepository repository;

  Future<void> call(NavigationTab tab) async {
    await repository.navigateToTab(tab);
  }
}

import 'package:equatable/equatable.dart';
import 'package:partywitty_test/features/navigation/domain/entities/navigation_tab_entities.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationTabChanged extends NavigationEvent {
  const NavigationTabChanged(this.tab);
  final NavigationTab tab;

  @override
  List<Object> get props => [tab];
}

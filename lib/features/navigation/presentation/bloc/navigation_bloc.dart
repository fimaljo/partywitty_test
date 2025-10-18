import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partywitty_test/features/navigation/domain/usecases/navigate_to_tab_usecase.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_event.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_state.dart';

import '../../domain/entities/navigation_tab_entities.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc({required this.navigateToTabUseCase})
    : super(const NavigationState(currentTab: NavigationTab.home)) {
    on<NavigationTabChanged>(_onNavigationTabChanged);
  }

  final NavigateToTabUseCase navigateToTabUseCase;

  void _onNavigationTabChanged(
    NavigationTabChanged event,
    Emitter<NavigationState> emit,
  ) {
    try {
      emit(state.copyWith(currentTab: event.tab, isLoading: true));

      navigateToTabUseCase(event.tab)
          .then((_) {
            if (!isClosed && state.currentTab == event.tab) {
              emit(state.copyWith(isLoading: false));
            }
          })
          .catchError((Object error) {
            if (!isClosed) {
              emit(state.copyWith(isLoading: false, error: error.toString()));
            }
          });
    } on Exception catch (error) {
      emit(state.copyWith(isLoading: false, error: error.toString()));
    }
  }
}

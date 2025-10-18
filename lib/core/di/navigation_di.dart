import 'package:go_router/go_router.dart';
import 'package:partywitty_test/core/di/injection_container.dart';
import 'package:partywitty_test/features/navigation/data/repositories/navigation_repository_impl.dart';
import 'package:partywitty_test/features/navigation/domain/repositories/navigation_repository.dart';
import 'package:partywitty_test/features/navigation/domain/usecases/navigate_to_tab_usecase.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_bloc.dart';

void setupNavigationDependencies() {
  sl
    ..registerLazySingleton<NavigationRepository>(
      () => NavigationRepositoryImpl(sl<GoRouter>()),
    )
    ..registerLazySingleton(() => NavigateToTabUseCase(sl()))
    ..registerLazySingleton(() => NavigationBloc(navigateToTabUseCase: sl()));
}

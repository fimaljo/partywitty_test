import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:partywitty_test/core/di/injection_container.dart';

import 'core/navigation/app_router.dart';
import 'features/navigation/presentation/bloc/navigation_bloc.dart';

final sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize router
  final router = AppRouter.createRouter();

  // Setup global service locator (registers router, blocs, etc.)
  await setupServiceLocator(router);

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (_) => sl<NavigationBloc>()),
      ],
      child: MaterialApp.router(
        title: 'PartyWitty',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF6A4C93),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

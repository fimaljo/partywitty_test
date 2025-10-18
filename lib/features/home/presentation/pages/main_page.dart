import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {},
      child: Scaffold(
        body: SafeArea(
          child: Column(children: [Center(child: Text("home"))]),
        ),
      ),
    );
  }
}

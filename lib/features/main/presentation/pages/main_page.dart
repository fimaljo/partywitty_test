import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partywitty_test/features/navigation/domain/entities/navigation_tab_entities.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_event.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_state.dart';
import 'package:partywitty_test/features/navigation/presentation/widgets/app_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Navigation error: ${state.error}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF7B5CF0).withValues(alpha: 0.1),
                Colors.yellow.withValues(alpha: 0.1),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BlocSelector<NavigationBloc, NavigationState, NavigationTab>(
              selector: (state) => state.currentTab,
              builder: (context, currentTab) {
                return AppNavigationBar(
                  currentIndex: currentTab.index,
                  onNavTap: (index) {
                    final tab = NavigationTab.values[index];
                    if (tab != currentTab) {
                      context.read<NavigationBloc>().add(
                        NavigationTabChanged(tab),
                      );
                    }
                  },
                );
              },
            ),
      ),
    );
  }
}

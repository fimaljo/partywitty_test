import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partywitty_test/shared/widgets/custom_app_bar.dart';
import 'package:partywitty_test/features/navigation/domain/entities/navigation_tab_entities.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_event.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_state.dart';
import 'package:partywitty_test/features/navigation/presentation/widgets/app_navigation_bar.dart';
import 'package:partywitty_test/shared/widgets/party_witty_drawer.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  const MainPage({required this.child, super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  NavigationTab? _prevTab;

  void openDrawer(NavigationTab currentTab) {
    _prevTab ??= currentTab;
    _scaffoldKey.currentState?.openDrawer();
  }

  void handleDrawerClosed() {
    _prevTab = null;
  }

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
        appBar: const CustomAppBar(),
        key: _scaffoldKey,
        drawer: PartyWittyDrawer(),
        onDrawerChanged: (isOpened) {
          if (!isOpened) {
            handleDrawerClosed();
          }
        },
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
          child: widget.child,
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            final selectedTab = _prevTab ?? state.currentTab;
            return AppNavigationBar(
              currentIndex: selectedTab.index,
              onNavTap: (index) {
                final tab = NavigationTab.values[index];
                if (tab == NavigationTab.moreItems) {
                  openDrawer(state.currentTab);
                } else {
                  if (tab != state.currentTab) {
                    context.read<NavigationBloc>().add(
                      NavigationTabChanged(tab),
                    );
                  }
                  _prevTab = null;
                }
              },
            );
          },
        ),
      ),
    );
  }
}

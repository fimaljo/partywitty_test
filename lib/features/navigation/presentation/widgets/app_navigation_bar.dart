import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_event.dart';

import '../../domain/entities/navigation_tab_entities.dart';
import '../bloc/navigation_bloc.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    required this.currentIndex,
    required this.onNavTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onNavTap;

  @override
  Widget build(BuildContext context) {
    final currentTab = NavigationTab.values[currentIndex];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: NavigationTab.values.map((tab) {
              return _buildNavItem(context, tab, currentTab, tab.label);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    NavigationTab tab,
    NavigationTab currentTab,
    String label,
  ) {
    final isSelected = currentTab == tab;
    final theme = Theme.of(context);
    const deepPurple = Color(0xFF6A4C93);

    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabTap(context, tab),
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected ? tab.activeIcon : tab.icon,
                size: isSelected ? 26 : 22,
                color: isSelected
                    ? deepPurple
                    : theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: isSelected
                      ? deepPurple
                      : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabTap(BuildContext context, NavigationTab tab) {
    context.read<NavigationBloc>().add(NavigationTabChanged(tab));
    onNavTap(NavigationTab.values.indexOf(tab));
  }
}

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

    const activeColor = Color(0xFF7B5CF0);
    const inactiveColor = Color(0xFFA9A9B2);
    const backgroundGradientStart = Color(0xFFF7F5FF);
    const backgroundGradientEnd = Color(0xFFECE7FF);

    final firstTabs = NavigationTab.values.take(2).toList();
    final lastTabs = NavigationTab.values.skip(2).toList();

    return SizedBox(
      height: 85,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [backgroundGradientStart, backgroundGradientEnd],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: CustomPaint(
              size: const Size(double.infinity, 80),
              painter: _NavBarPainter(),
            ),
          ),

          Positioned.fill(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...firstTabs.map(
                  (tab) => _buildNavItem(
                    context,
                    tab,
                    currentTab,
                    activeColor,
                    inactiveColor,
                  ),
                ),
                const SizedBox(width: 70),
                ...lastTabs.map(
                  (tab) => _buildNavItem(
                    context,
                    tab,
                    currentTab,
                    activeColor,
                    inactiveColor,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: -10,
            child: GestureDetector(
              onTap: () => onNavTap(-1),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeColor,
                  boxShadow: [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.35),
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    NavigationTab tab,
    NavigationTab currentTab,
    Color activeColor,
    Color inactiveColor,
  ) {
    final isSelected = currentTab == tab;

    return GestureDetector(
      onTap: () => _onTabTap(context, tab),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? tab.activeIcon : tab.icon,
            size: 24,
            color: isSelected ? activeColor : inactiveColor,
          ),
          const SizedBox(height: 4),
          Text(
            tab.label,
            style: TextStyle(
              color: isSelected ? activeColor : inactiveColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  void _onTabTap(BuildContext context, NavigationTab tab) {
    context.read<NavigationBloc>().add(NavigationTabChanged(tab));
    onNavTap(NavigationTab.values.indexOf(tab));
  }
}

class _NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFFFFF), Color(0xFFF8F8FA)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    final centerX = size.width / 2;
    const bumpRadius = 38.0;
    const bumpDepth = 20.0;

    path.moveTo(0, 0);
    path.lineTo(centerX - bumpRadius - 20, 0);

    path.quadraticBezierTo(
      centerX - bumpRadius,
      -2,
      centerX - bumpRadius + 10,
      -bumpDepth / 2,
    );

    path.cubicTo(
      centerX - bumpRadius / 2,
      -bumpDepth - 6,
      centerX + bumpRadius / 2,
      -bumpDepth - 6,
      centerX + bumpRadius - 10,
      -bumpDepth / 2,
    );

    path.quadraticBezierTo(
      centerX + bumpRadius,
      -2,
      centerX + bumpRadius + 20,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.08), 6.0, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

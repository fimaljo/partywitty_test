import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const CustomAppBar({super.key, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  Widget _buildIconContainer(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
          'assets/party_witty_logo.svg',
          height: 32,
          width: 32,
        ),
      ),

      actions: [
        _buildIconContainer(Icons.notifications_none, () {}),
        _buildIconContainer(Icons.qr_code_scanner, () {}),
        _buildIconContainer(Icons.toys_outlined, () {}),
        const SizedBox(width: 8),
      ],
    );
  }
}

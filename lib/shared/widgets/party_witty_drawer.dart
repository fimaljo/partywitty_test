import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartyWittyDrawer extends StatelessWidget {
  const PartyWittyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _drawerHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: _mainMenuItems(),
            ),
          ),
          _signInButton(),
        ],
      ),
    );
  }

  Widget _drawerHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              'assets/party_witty_text_logo.svg',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _mainMenuItems() {
    final items = [
      _DrawerMenuItem(icon: Icons.event_note, title: 'My Plan'),
      _DrawerMenuItem(icon: Icons.gavel, title: 'My Bids'),
      _DrawerMenuItem(icon: Icons.book_online, title: 'My Booking'),
      _DrawerMenuItem(icon: Icons.search, title: 'Search'),
      _DrawerMenuItem(icon: Icons.notifications_none, title: 'Notifications'),
      _DrawerMenuItem(
        icon: Icons.location_on_outlined,
        title: 'Select Location',
      ),
      _DrawerMenuItem(icon: Icons.bookmark_border, title: 'Saved Items'),
      _DrawerMenuItem(icon: Icons.favorite_border, title: 'Favorites'),
    ];
    return items;
  }

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        icon: const Icon(Icons.login, color: Colors.black),
        label: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hello!', style: TextStyle(color: Colors.black)),
            Text(
              'Please Sign In',
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final IconData? icon;
  final String title;

  const _DrawerMenuItem({this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      onTap: () {},
    );
  }
}

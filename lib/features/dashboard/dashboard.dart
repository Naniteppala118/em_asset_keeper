import 'package:em_asset_keeper/features/about_app/about_app_screen.dart';
import 'package:em_asset_keeper/features/find_new_assets/view/find_new_assets_screen_two.dart';
import 'package:em_asset_keeper/features/new_asset/new_asset_screen.dart';
import 'package:em_asset_keeper/features/register_asset/register_asset_screen.dart';
import 'package:em_asset_keeper/features/registered_asset/registered_asset_screen.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: NewAssetScreen()),
    const Center(child: RegisteredScreen()),
    Center(child: AboutAppScreen()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            label: 'Find New Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'My Registered Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About App',
          ),
        ],
      ),
    );
  }
}

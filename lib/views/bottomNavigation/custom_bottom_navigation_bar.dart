import 'package:flutter/material.dart';
import 'package:firebase_auth/utils/colors.dart';
import 'package:firebase_auth/views/dashboard/dashboard_screen.dart';
import 'package:firebase_auth/views/diagnostics/diagnostics_screen.dart';
import 'package:firebase_auth/views/maintenance/maintenance_screen.dart';
import 'package:firebase_auth/views/settings/settings_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashBoardScreen(),
    const MaintenanceScreen(),
    const DiagnosticsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // Remove background color from scaffold
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor:
              Colors.transparent, // Set the background color to transparent
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard,
                  color: _selectedIndex == 0 ? Colors.white : Colors.grey),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build,
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey),
              label: 'Maintenance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_input_component,
                  color: _selectedIndex == 2 ? Colors.white : Colors.grey),
              label: 'Diagnostics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: _selectedIndex == 3 ? Colors.white : Colors.grey),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

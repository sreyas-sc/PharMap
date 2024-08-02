import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mcamajor/screens/login_screen.dart'; // Assuming correct path
import 'package:mcamajor/screens/genericmedicinesearch_screen.dart'; // Assuming correct path
import 'package:mcamajor/screens/medicinereminder_screen.dart'; // Assuming correct path

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 150, 243, 1),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Add navigation logic here
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Add navigation logic here
              },
            ),
            // Logout button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Image.asset('assets/icons/user.png', width: 30, height: 30),
          Image.asset('assets/icons/document.png', width: 30, height: 30),
          Image.asset('assets/icons/placeholder.png', width: 30, height: 30),
          Image.asset('assets/icons/loupe.png', width: 30, height: 30),
          Image.asset('assets/icons/medicine.png', width: 30, height: 30),
          Image.asset('assets/icons/bell.png', width: 30, height: 30),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      body: Stack(
        children: [
          _buildPage(_pageIndex),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Page 0 Content'));
      case 1:
        return const Center(child: Text('Page 1 Content'));
      case 2:
        return const Center(child: Text('Page 2 Content'));
      case 4:
        return const GenericMedicineSearchScreen();
      case 5:
        return const GenericMedicineSearchScreen(); // Make sure this is the correct constructor call for your MedicineReminderPage widget
      default:
        return Container(); // Handle other cases if needed
    }
  }
}

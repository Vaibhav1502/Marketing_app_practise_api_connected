import 'package:api_demo_calling/Screens/blog_ui.dart';
import 'package:api_demo_calling/Screens/contact_enq_getPage_ui.dart';
import 'package:api_demo_calling/Screens/contact_enq_ui.dart';
import 'package:api_demo_calling/Screens/partner_ui.dart';
import 'package:api_demo_calling/Screens/servenq_ui.dart';
import 'package:flutter/material.dart';

class BottomNavExample extends StatefulWidget {
  const BottomNavExample({super.key});

  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;

  // ❌ STEP 1: DELETE THE _screens LIST ENTIRELY
  // final List<Widget> _screens = [ ... ]; // <-- DELETE THIS

  // ✅ STEP 2: CREATE A HELPER METHOD TO BUILD THE CURRENT SCREEN
  Widget _buildCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return Servicenq();
      case 1:
        return EnquiryListScreen();
      case 2:
        return BlogListScreen();
      case 3:
        return ContactEnq();
      case 4:
        return PartnerUi();
      default:
        return Servicenq(); // Default case
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ STEP 3: USE THE HELPER METHOD IN THE BODY
      body: _buildCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        iconSize: 25,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_rounded), label: 'blog'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_phone_rounded), label: 'contact'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Partner'),
        ],
      ),
    );
  }
}
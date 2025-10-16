import 'package:api_demo_calling/Screens/blog_ui.dart';
import 'package:api_demo_calling/Screens/contact_enq_getPage_ui.dart';
import 'package:api_demo_calling/Screens/contact_enq_ui.dart';
import 'package:api_demo_calling/Screens/partner_ui.dart';
import 'package:api_demo_calling/Screens/servenq_ui.dart';
import 'package:flutter/material.dart';

class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;

  final List<Widget> _screens =  [
    Servicenq(),
    EnquiryListScreen(),
    BlogListScreen(),
    ContactEnq(),
    PartnerUi() 
   
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      _screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
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
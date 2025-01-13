import 'package:flutter/material.dart';
import 'package:planner/screens/PhoneBookPage.dart'; // Pastikan path sudah benar
import 'package:planner/screens/profile_page.dart'; // Pastikan path sudah benar
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:planner/screens/calendar_page.dart'; // Impor CalendarPage
import 'package:planner/screens/daily_planner_page.dart'; // Impor DailyPlannerPage
import 'package:planner/screens/todo_list_page.dart'; // Impor TodoListPage
import 'package:planner/screens/CalculatorModal.dart'; // Impor kalkulator modal

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    PhoneBookPage(), // Mengarahkan ke halaman PhoneBook
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildLargeButton(BuildContext context, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 380,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WILDBERRY PLANNER'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/logo utama wildberry.png',
              height: 40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(), // Tautkan ke halaman Profile
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Profile.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            _buildLargeButton(
              context,
              'assets/calendar.png',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalendarPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            _buildLargeButton(
              context,
              'assets/dailyplanner.png',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DailyPlannerPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            _buildLargeButton(
              context,
              'assets/to do list.png',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoListPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'PhoneBook', // Ikon untuk PhoneBook
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', // Ikon untuk Profile
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF9F2AFF),
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhoneBookPage(), // Navigasi ke PhoneBook
                ),
              );
            } else if (_selectedIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(), // Navigasi ke Profile
                ),
              );
            }
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calculate),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => CalculatorModal(),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mobile_layout/navbar/home.dart';
import 'package:mobile_layout/navbar/stopwatch.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bantuan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Aplikasi ini memiliki banyak fungsi :',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '1 . List anggota',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 2),
            Text(
              '2 . List bilangan prima',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 2),
            Text(
              '3 . Menghitung segitiga',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 2),
            Text(
              '4 . List situs rekomendasi',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 2),
            Text(
              '5 . List situs favorite',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 2),
            Text(
              '6 . Stopwatch',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 2),
            Text(
              'Dan memiliki fitur logout di kanan bawah',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 2),
            Text(
              'Aplikasi ini telah dibuat user friendly',
              style: TextStyle(fontSize: 16),
            ),SizedBox(height: 2),
            Text(
              'jadi mudah dipahami oleh user',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer, color: Colors.black),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help, color: Colors.pink),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout, color: Colors.black),
            label: 'Logout',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => StopwatchMenu()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Help()),
            );
          } else if (index == 3) {
            // Lakukan proses logout
          }
        },
      ),
    );
  }
}

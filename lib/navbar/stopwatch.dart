import 'package:flutter/material.dart';
import 'package:mobile_layout/navbar/help.dart';
import 'dart:async';
import 'package:mobile_layout/navbar/home.dart';

class StopwatchMenu extends StatefulWidget {
  const StopwatchMenu({super.key});

  @override
  _StopwatchMenuState createState() => _StopwatchMenuState();
}

class _StopwatchMenuState extends State<StopwatchMenu> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  int _elapsedTime = 0;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        _elapsedTime = _stopwatch.elapsedMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Batalkan timer saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch Menu'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formatTime(_elapsedTime),
            style: const TextStyle(fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _stopwatch.start();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Start'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _stopwatch.stop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Stop'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _stopwatch.reset();
                  _elapsedTime = 0;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black), // Warna ikon hitam
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer, color: Colors.pink), // Warna ikon hitam
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help, color: Colors.black), // Warna ikon hitam
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout, color: Colors.black), // Warna ikon hitam
            label: 'Logout',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black, // Warna ikon ketika tidak dipilih
        showSelectedLabels: true, // Menampilkan teks pada item yang dipilih
        showUnselectedLabels:
            true, // Menampilkan teks pada item yang tidak dipilih
        onTap: (int index) {
          // Handle bottom navigation item taps
          // Misalnya:
          if (index == 0) {
            // Navigasi ke halaman utama
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          } else if (index == 1) {
            // Navigasi ke halaman stopwatch
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const StopwatchMenu()),
            );
          } else if (index == 2) {
            // Navigasi ke halaman bantuan
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

  String formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}

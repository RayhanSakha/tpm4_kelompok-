import 'package:flutter/material.dart';
import 'package:mobile_layout/logout.dart';
import 'package:mobile_layout/menu/anggota.dart';
import 'package:mobile_layout/menu/bilPrima.dart';
import 'package:mobile_layout/menu/favorite.dart';
import 'package:mobile_layout/menu/hitungSegitigta.dart';
import 'package:mobile_layout/menu/situsRekomendasi.dart';
import 'package:mobile_layout/navbar/help.dart';
import 'package:mobile_layout/navbar/stopwatch.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to Daftar Anggota
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnggotaList()),
                );
              },
              child: const Text('Daftar Anggota'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Aplikasi Bilangan Prima
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BilanganPrima()),
                );
              },
              child: const Text('Bilangan Prima'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Aplikasi Pengitung Luas dan Keliling Segitiga
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HitungSegitiga()),
                );
              },
              child: const Text('Hitung Luas dan Keliling Segitiga'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Daftar Situs Rekomendasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListEcommerce()),
                );
              },
              child: const Text('Daftar Situs Rekomendasi'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Favorite
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorite()),
                );
              },
              child: const Text('Favorite'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.pink), // Warna ikon hitam
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer, color: Colors.black), // Warna ikon hitam
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LogoutPage()),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_layout/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Apakah Anda yakin ingin keluar?',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                child: Text('Tidak'),
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
              ),
              ElevatedButton(
                child: Text('Ya'),
                onPressed: () {
                  _logout(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) async {
    // Mengatur status sesi menjadi off
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigasi kembali ke halaman login dan menghapus semua halaman di atasnya
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
          (route) => false,
    );
  }
}
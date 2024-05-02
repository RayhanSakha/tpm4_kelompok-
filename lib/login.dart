import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobile_layout/navbar/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future<void> _checkIfAlreadyLoggedIn(BuildContext context) async {
      SharedPreferences loginData = await SharedPreferences.getInstance();
      bool isLoggedIn = loginData.getBool('isLoggedIn') ?? false;
      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    }

    void _saveLoginStatus(bool isLoggedIn) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', isLoggedIn);
    }

    Future<bool> _getLoginStatus() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool('isLoggedIn') ?? false;
    }

    Future<void> _authenticateUser(BuildContext context) async {
      // Lakukan autentikasi disini, misalnya memeriksa username dan password
      String username = usernameController.text;
      String password = passwordController.text;

      // Contoh autentikasi sederhana: jika username dan password cocok, tandai sebagai berhasil
      bool isAuthenticationSuccessful =
          username == 'admin' && password == 'admin';

      if (isAuthenticationSuccessful) {
        _saveLoginStatus(true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        // Jika autentikasi gagal, tampilkan pesan kesalahan atau tindakan yang sesuai
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Authentication Failed'),
              content: Text('Invalid username or password. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

    // Memanggil fungsi _checkIfAlreadyLoggedIn saat widget dibuat
    _checkIfAlreadyLoggedIn(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Panggil fungsi untuk melakukan autentikasi
                await _authenticateUser(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
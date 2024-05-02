import 'package:flutter/material.dart';
import 'dart:math';

class HitungSegitiga extends StatefulWidget {
  const HitungSegitiga({Key? key}) : super(key: key);

  @override
  _HitungSegitigaState createState() => _HitungSegitigaState();
}

class _HitungSegitigaState extends State<HitungSegitiga> {
  final TextEditingController _alasController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  double _luas = 0;
  double _keliling = 0;

  void _hitungLuasKeliling() {
    double alas = double.tryParse(_alasController.text) ?? 0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0;

    double luas = 0.5 * alas * tinggi;
    double keliling = alas + tinggi + (sqrt(pow(alas, 2) + pow(tinggi, 2)));

    setState(() {
      _luas = luas;
      _keliling = keliling;
    });
  }

  void _clear() {
    setState(() {
      _alasController.clear();
      _tinggiController.clear();
      _luas = 0;
      _keliling = 0;
    });
  }

  @override
  void dispose() {
    _alasController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas dan Keliling Segitiga Siku-siku'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _alasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Alas'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hitungLuasKeliling,
              child: Text('Proses'),
            ),
            SizedBox(height: 16),
            Text(
              'Luas: $_luas',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Keliling: $_keliling',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _clear,
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}

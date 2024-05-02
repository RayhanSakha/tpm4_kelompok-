import 'package:flutter/material.dart';

class BilanganPrima extends StatefulWidget {
  const BilanganPrima({Key? key}) : super(key: key);

  @override
  _BilanganPrimaState createState() => _BilanganPrimaState();
}

class _BilanganPrimaState extends State<BilanganPrima> {
  final TextEditingController _batasBawahController = TextEditingController();
  final TextEditingController _batasAtasController = TextEditingController();

  List<int> _bilanganPrima = [];
  int _jumlahBilanganPrima = 0;
  double _rataRataBilanganPrima = 0;

  void _prosesBilanganPrima() {
    setState(() {
      _bilanganPrima.clear();

      int batasBawah = int.parse(_batasBawahController.text);
      int batasAtas = int.parse(_batasAtasController.text);

      for (int i = batasBawah; i <= batasAtas; i++) {
        if (_isBilanganPrima(i)) {
          _bilanganPrima.add(i);
        }
      }

      _jumlahBilanganPrima = _bilanganPrima.length;

      if (_jumlahBilanganPrima > 0) {
        double total = _bilanganPrima.reduce((a, b) => a + b).toDouble();
        _rataRataBilanganPrima = total / _jumlahBilanganPrima;
      } else {
        _rataRataBilanganPrima = 0;
      }
    });
  }

  bool _isBilanganPrima(int number) {
    if (number <= 1) {
      return false;
    }

    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }

    return true;
  }

  void _clear() {
    setState(() {
      _batasBawahController.clear();
      _batasAtasController.clear();
      _bilanganPrima.clear();
      _jumlahBilanganPrima = 0;
      _rataRataBilanganPrima = 0;
    });
  }

  @override
  void dispose() {
    _batasBawahController.dispose();
    _batasAtasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Bilangan Prima'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _batasBawahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Batas Bawah'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _batasAtasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Batas Atas'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _prosesBilanganPrima,
              child: Text('Proses'),
            ),
            SizedBox(height: 16),
            Text('Jumlah Bilangan Prima: $_jumlahBilanganPrima'),
            Text('Rata-rata Bilangan Prima: $_rataRataBilanganPrima'),
            SizedBox(height: 16),
            Text(
              'Bilangan Prima:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _bilanganPrima.length,
              itemBuilder: (context, index) {
                return Text(_bilanganPrima[index].toString());
              },
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

import 'package:flutter/material.dart';

class Anggota {
  final String nama;
  final String nim;

  Anggota({required this.nama, required this.nim});
}

class AnggotaCard extends StatelessWidget {
  final Anggota anggota;

  const AnggotaCard({Key? key, required this.anggota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(anggota.nama),
        subtitle: Text(anggota.nim),
      ),
    );
  }
}

class AnggotaList extends StatelessWidget {
  final List<Anggota> anggotaList = [
    Anggota(nama: 'Wahyu Vance', nim: '123210004'),
    Anggota(nama: 'Aditya Septiawan', nim: '123210014'),
    Anggota(nama: 'Rayhan Fairuz Sakha', nim: '123210028'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota'),
      ),
      body: ListView.builder(
        itemCount: anggotaList.length,
        itemBuilder: (context, index) {
          return AnggotaCard(anggota: anggotaList[index]);
        },
      ),
    );
  }
}

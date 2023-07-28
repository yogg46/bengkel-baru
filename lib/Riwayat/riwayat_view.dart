import 'package:flutter/material.dart';

class RiwayatPemesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan'),
      ),
      body: ListView.builder(
        itemCount: riwayatPemesanan.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.history),
            title: Text(riwayatPemesanan[index].serviceTitle),
            subtitle: Text(riwayatPemesanan[index].tanggal),
            trailing: Text(riwayatPemesanan[index].status),
          );
        },
      ),
    );
  }
}

class RiwayatPemesanan {
  final String serviceTitle;
  final String tanggal;
  final String status;

  RiwayatPemesanan({
    required this.serviceTitle,
    required this.tanggal,
    required this.status,
  });
}

List<RiwayatPemesanan> riwayatPemesanan = [
  RiwayatPemesanan(
    serviceTitle: 'Service A',
    tanggal: '12 Mei 2023',
    status: 'Selesai',
  ),
  RiwayatPemesanan(
    serviceTitle: 'Service B',
    tanggal: '10 Mei 2023',
    status: 'Belum Selesai',
  ),
  // Tambahkan riwayat pemesanan lain sesuai kebutuhan
];

void main() {
  runApp(MaterialApp(
    home: RiwayatPemesananPage(),
  ));
}

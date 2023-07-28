import 'package:bengkel/booking.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang di Dashboard',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PemesananBengkelPage()),
                );
              },
              child: Text('Pemesanan Bengkel'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan fungsi aksi ketika tombol ditekan
              },
              child: Text('Riwayat Pemesanan'),
            ),
          ],
        ),
      ),
    );
  }
}

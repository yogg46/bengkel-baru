import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  DateTime selectedDate = DateTime.now();
  int currentQueueNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Antrian'),
        backgroundColor: Color.fromARGB(255, 121, 35, 8),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tanggal: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showDatePicker(context);
                  },
                  child: Text('Pilih Tanggal'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('pemesanan_service')
                  .orderBy('tanggalPemesanan')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  var queueList =
                      snapshot.data!.docs.map((doc) => doc.data()).toList();
                  return ListView.builder(
                    itemCount: queueList.length,
                    itemBuilder: (context, index) {
                      var data = queueList[index] as Map<String, dynamic>;
                      var tanggalPemesanan = data['tanggalPemesanan'];
                      DateTime? tanggal;
                      if (tanggalPemesanan is Timestamp) {
                        tanggal = tanggalPemesanan.toDate();
                      }

                      if (tanggal != null &&
                          tanggal.day == selectedDate.day &&
                          tanggal.month == selectedDate.month &&
                          tanggal.year == selectedDate.year) {
                        currentQueueNumber++;
                        var queueNumber = currentQueueNumber;
                        var alamat = data['alamat'];
                        var keluhan = data['keluhan'];
                        var deskripsi = data['deskripsi'];
                        var nama = data['nama'];
                        var noHp = data['noHp'];
                        var nomorKendaraan = data['nomorKendaraan'];
                        
                        var waktuEstimasi = selectedDate.add(Duration(minutes: (queueNumber - 1) * 30));
                        var formattedHour = waktuEstimasi.hour > 12 ? waktuEstimasi.hour - 12 : waktuEstimasi.hour;
                        var amPm = waktuEstimasi.hour >= 12 ? 'PM' : 'AM';

                        return ListTile(
                          title: Text('Antrian $queueNumber'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama: $nama'),
                              Text('Keluhan: $keluhan'),
                              Text('Estimasi Waktu: ${formattedHour.toString().padLeft(2, '0')}:${waktuEstimasi.minute.toString().padLeft(2, '0')} $amPm'),
                            ],
                          ),
                          trailing: tanggal != null
                              ? Text(
                                  'Tanggal: ${tanggal.day}/${tanggal.month}/${tanggal.year}',
                                )
                              : null,
                        );
                      } else {
                        currentQueueNumber = 0;
                        return Container(); // Jika tidak sesuai tanggal, tidak ditampilkan
                      }
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        currentQueueNumber = 0;
      });
    }
  }
}

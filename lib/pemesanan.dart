import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PemesananServicePage extends StatefulWidget {
  @override
  _PemesananServicePageState createState() => _PemesananServicePageState();
}

class _PemesananServicePageState extends State<PemesananServicePage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _noHpController = TextEditingController();
  TextEditingController _nomorKendaraanController = TextEditingController();
  TextEditingController _keluhanController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    _noHpController.dispose();
    _nomorKendaraanController.dispose();
    _keluhanController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void clearFormFields() {
    _namaController.clear();
    _alamatController.clear();
    _noHpController.clear();
    _nomorKendaraanController.clear();
    _keluhanController.clear();
    _deskripsiController.clear();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan Service'),
        backgroundColor: Color.fromARGB(255, 120, 44, 44),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Form Pemesanan Service',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Siapa namamu?',
                  labelText: 'Nama *',
                ),
              ),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.home),
                  hintText: 'Dimana kamu tinggal?',
                  labelText: 'Alamat *',
                ),
              ),
              TextFormField(
                controller: _noHpController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.call),
                  hintText: 'Berapa nomor wa kamu?',
                  labelText: 'No Whatsapp *',
                ),
              ),
              TextFormField(
                controller: _nomorKendaraanController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.bedroom_child_sharp),
                  hintText: 'Berapa nomor kendaraan kamu?',
                  labelText: 'Nomor kendaraan *',
                ),
              ),
              TextFormField(
                controller: _keluhanController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.car_crash),
                  hintText: 'Apa keluhan kamu?',
                  labelText: 'Keluhan *',
                ),
              ),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.list_alt_sharp),
                  hintText: 'Tambahkan pesan?',
                  labelText: 'Deskripsi *',
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    String nama = _namaController.text;
                    String alamat = _alamatController.text;
                    String noHp = _noHpController.text;
                    String nomorKendaraan = _nomorKendaraanController.text;
                    String keluhan = _keluhanController.text;
                    Timestamp tanggalPemesanan = Timestamp.fromDate(_selectedDate ?? DateTime.now());
                    String deskripsi = _deskripsiController.text;

                    try {
                      await FirebaseFirestore.instance.collection('pemesanan_service').add({
                        'nama': nama,
                        'alamat': alamat,
                        'noHp': noHp,
                        'nomorKendaraan': nomorKendaraan,
                        'keluhan': keluhan,
                        'tanggalPemesanan': tanggalPemesanan,
                        'deskripsi': deskripsi,
                      });

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Pemesanan Service Berhasil'),
                            content: Text('Terima kasih!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  clearFormFields();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Terjadi Kesalahan'),
                            content: Text('Gagal menyimpan data: $e'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    "Pesanan Sekarang",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 120, 44, 44),
                    fixedSize: Size(140, 40),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    "Pilih Tanggal Pemesanan",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 120, 44, 44),
                    fixedSize: Size(200, 40),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  _selectedDate != null
                      ? 'Tanggal Pemesanan: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'
                      : 'Tanggal Pemesanan belum dipilih',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
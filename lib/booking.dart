import 'package:bengkel/pemesanan.dart';
import 'package:bengkel/profile/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home/home_view.dart';

class PemesananBengkelPage extends StatefulWidget {
  @override
  _PemesananBengkelPageState createState() => _PemesananBengkelPageState();
}

class _PemesananBengkelPageState extends State<PemesananBengkelPage> {
  String selectedBengkel = '';
  String selectedJasa = '';

  List<String> bengkelList = ['Bengkel A', 'Bengkel B', 'Bengkel C'];
  List<String> jasaList = ['Service', 'Ganti Oli', 'Tune Up'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Purnomo Mobil',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color.fromARGB(255, 121, 35, 8),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Layanan Servis",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/oli6.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli2.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli3.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli4.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli7.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli8.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/oli.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Oli',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/fanbelt1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/fanbelt1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/fanbelt2.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/fanbelt3.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/fanbelt4.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/fanbelt5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/repair.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Fanbelt',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/mesin6.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/mesin1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/mesin2.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/mesin3.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/mesin4.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/mesin5.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/mes.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Mesin',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/kampas1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/rem1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/rem.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Rem',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/suspensi1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/suss.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Suspensi',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/kopling1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/kopling.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Kopling',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/ban1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/ban.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Ban',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/tuneup1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/tuneup2.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/tuneup3.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/tuneup4.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/tuneup5.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/tuneup6.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/tuneup.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Tuneup',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Purnomo Mobil'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ItemTerbaru(
                                          image: "assets/images/ac1.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/ac2.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/ac3.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/ac4.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/ac5.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/ac6.png",
                                        ),
                                        ItemTerbaru(
                                          image: "assets/images/oli5.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.3),
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/ac.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Ac',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ItemTerbaru(
                          image: "assets/images/promo1.png",
                        ),
                        ItemTerbaru(
                          image: "assets/images/promo2.png",
                        ),
                        ItemTerbaru(
                          image: "assets/images/tip1.jpg",
                        ),
                        ItemTerbaru(
                          image: "assets/images/tip2.jpg",
                        ),
                        ItemTerbaru(
                          image: "assets/images/tuneup oke.png",
                        ),
                        ItemTerbaru(
                          image: "assets/images/oli5.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ItemTerbaru extends StatelessWidget {
  ItemTerbaru({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 121, 35, 8),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}

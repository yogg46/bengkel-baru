import 'package:bengkel/pemesanan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
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
          child: Column(
            children: [
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/satu.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 22),
                    Text(
                      "Kenapa Harus Kami",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Kami merupakan bengkel profesional yang telah berpengalaman selama puluhan tahun dalam menangani permasalahan kendaraan. Dengan berbagai pengalaman dan pekerjaan yang kami kerjakan dengan mesin dan alat yang memiliki hasil diagnosa yang akurat. Dan juga dengan menjamin garansi servis yang memastikan hasil yang terbaik untuk kepuasan bagi perawatan mobil anda.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PemesananServicePage(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        "Buat Pesanan",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 121, 35, 8),
                        fixedSize: Size(140, 40),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Blog Terbaru",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ItemTerbaru(
                            image: "assets/images/a.jpeg",
                          ),
                          ItemTerbaru(
                            image: "assets/images/b.jpeg",
                          ),
                          ItemTerbaru(
                            image: "assets/images/c.jpeg",
                          ),
                          ItemTerbaru(
                            image: "assets/images/d.jpeg",
                          ),
                          ItemTerbaru(
                            image: "assets/images/e.jpeg",
                          ),
                          ItemTerbaru(
                            image: "assets/images/f.jpeg",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      '"Bengkel Purnomo Mobil"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Jalan Slamet Riyadi Kavling Pemkot no.38A (Belakang Polsek Kartoharjo), Madiun, Indonesia, 63117",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "bengkelpurnomomobil@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Telepon: 0813-3562-2690",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemTerbaru extends StatelessWidget {
  ItemTerbaru({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.amber,
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

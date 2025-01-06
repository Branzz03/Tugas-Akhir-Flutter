import 'package:flutter/material.dart';
import 'package:fti_outdor/home_screen.dart';

class RegistrationPageslamet extends StatelessWidget {
  final String tripName;

  const RegistrationPageslamet({Key? key, required this.tripName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('$tripName Registration',
        style: TextStyle(fontSize: 20, color: Colors.white),),
        backgroundColor: const Color(0xFF1565C0),
        elevation: 12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Detail Pendaftaran untuk Open Trip $tripName',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                '../assets/slamet/slamet1.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            sectionTitle('Apa Saja yang Harus Dibawa:'),
            const ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text('Sepatu gunung yang nyaman'),
            ),
            const ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text('Pakaian hangat dan jaket anti angin'),
            ),
            const ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text('Jas hujan atau ponco'),
            ),
            const ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text('Botol air minimal 1 liter'),
            ),
            const ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text('Obat-obatan pribadi'),
            ),
            const ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text('Alat makan pribadi (piring, sendok, gelas)'),
            ),
            const ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text('Matras dan sleeping bag'),
            ),
            const ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text('Kamera atau smartphone untuk dokumentasi'),
            ),
            const SizedBox(height: 16),
            sectionTitle('Fasilitas yang Disediakan:'),
            const ListTile(
              leading: Icon(Icons.local_shipping, color: Colors.blue),
              title: Text('Transportasi dari meeting point ke basecamp'),
            ),
            const ListTile(
              leading: Icon(Icons.fastfood, color: Colors.blue),
              title: Text('Makan 3 kali sehari selama trip'),
            ),
            const ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: Text('Tenda dan perlengkapan camping bersama'),
            ),
            const ListTile(
              leading: Icon(Icons.terrain, color: Colors.blue),
              title: Text('Pemandu gunung berpengalaman'),
            ),
            const ListTile(
              leading: Icon(Icons.backpack, color: Colors.blue),
              title: Text('Porter gunung'),
            ),
            const ListTile(
              leading: Icon(Icons.confirmation_number, color: Colors.blue),
              title: Text('Tiket masuk kawasan Gunung Arjuno'),
            ),
            const ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.blue),
              title: Text('Dokumentasi perjalanan'),
            ),
            const SizedBox(height: 16),
            sectionTitle('Hal yang Didapat dari Open Trip Gunung Arjuno:'),
            const ListTile(
              leading: Icon(Icons.explore, color: Colors.orange),
              title: Text('Pengalaman mendaki salah satu gunung tertinggi di Jawa Timur'),
            ),
            const ListTile(
              leading: Icon(Icons.landscape, color: Colors.orange),
              title: Text('Menikmati pemandangan alam yang menakjubkan'),
            ),
            const ListTile(
              leading: Icon(Icons.group, color: Colors.orange),
              title: Text('Menambah relasi dan teman baru selama perjalanan'),
            ),
            const ListTile(
              leading: Icon(Icons.eco, color: Colors.orange),
              title: Text('Mendapatkan wawasan tentang flora dan fauna di Gunung Arjuno'),
            ),
            const ListTile(
              leading: Icon(Icons.fitness_center, color: Colors.orange),
              title: Text('Melatih fisik dan mental melalui aktivitas mendaki'),
            ),
            const SizedBox(height: 16),
            sectionTitle('Formulir Pendaftaran:'),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Asal Kota',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Column(
                        children: const [
                          Icon(Icons.check_circle, color: Colors.blue, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'Pesanan Diterima',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      content: const Text(
                        'Pendaftaranmu sudah diterima dan Panitia Open Trip akan segera menghubungi kamu. Di tunggu ya...',
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                                                               Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Kembali',
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Daftar Sekarang',
              style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

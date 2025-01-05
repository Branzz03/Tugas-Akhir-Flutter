import 'package:flutter/material.dart';

class RegistrationPagesindoro extends StatelessWidget {
  final String tripName;

  const RegistrationPagesindoro({Key? key, required this.tripName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$tripName Registration'),
        backgroundColor: Colors.indigo.shade700,
        elevation: 12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Detail Pendaftaran untuk Open Trip $tripName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Image.asset(
              '../assets/sindoro/sindoro1.png', // Tambahkan gambar Gunung Arjuno di folder assets
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'Apa Saja yang Harus Dibawa:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('- Sepatu gunung yang nyaman'),
            const Text('- Pakaian hangat dan jaket anti angin'),
            const Text('- Jas hujan atau ponco'),
            const Text('- Botol air minimal 1 liter'),
            const Text('- Obat-obatan pribadi'),
            const Text('- Alat makan pribadi (piring, sendok, gelas)'),
            const Text('- Matras dan sleeping bag'),
            const Text('- Kamera atau smartphone untuk dokumentasi'),
            const SizedBox(height: 16),
            Text(
              'Fasilitas yang Disediakan:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('- Transportasi dari meeting point ke basecamp'),
            const Text('- Makan 3 kali sehari selama trip'),
            const Text('- Tenda dan perlengkapan camping bersama'),
            const Text('- Pemandu gunung berpengalaman'),
            const Text('- Porter gunung'),
            const Text('- Tiket masuk kawasan Gunung Arjuno'),
            const Text('- Dokumentasi perjalanan'),
            const SizedBox(height: 16),
            Text(
              'Hal yang Didapat dari Open Trip Gunung Arjuno:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('- Pengalaman mendaki salah satu gunung tertinggi di Jawa Timur'),
            const Text('- Menikmati pemandangan alam yang menakjubkan'),
            const Text('- Menambah relasi dan teman baru selama perjalanan'),
            const Text('- Mendapatkan wawasan tentang flora dan fauna di Gunung Arjuno'),
            const Text('- Melatih fisik dan mental melalui aktivitas mendaki'),
            const SizedBox(height: 16),
            Text(
              'Formulir Pendaftaran:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pendaftaran Berhasil untuk $tripName!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Daftar Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}

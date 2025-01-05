import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Tutorial Mendaki Gunung',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Persiapan Mendaki Gunung',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '1. Rencanakan pendakian dengan baik. Cari tahu tentang jalur pendakian, cuaca, dan peraturan yang berlaku di gunung tersebut.\n'
                    '2. Pastikan kondisi fisik dalam keadaan prima sebelum mendaki. Latihan fisik seperti jogging dan hiking sangat dianjurkan.\n'
                    '3. Bawa perlengkapan mendaki yang sesuai, seperti sepatu gunung, pakaian hangat, tenda, dan sleeping bag.\n'
                    '4. Jangan lupa membawa makanan dan minuman yang cukup untuk energi selama perjalanan.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Gambar pertama
              Center(
                child: Image.asset(
                  '../assets/tutorial/keamanan1.png',  // Ganti dengan nama file gambar yang diinginkan
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Tips Keamanan Saat Mendaki',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '1. Selalu mendaki bersama teman atau kelompok. Jangan mendaki sendirian untuk mengurangi risiko.\n'
                    '2. Gunakan peta atau aplikasi GPS untuk memastikan jalur pendakian yang benar.\n'
                    '3. Hindari membawa beban terlalu berat agar tidak cepat lelah.\n'
                    '4. Patuhi aturan dan larangan yang berlaku di area pendakian. Jaga kebersihan dan jangan merusak alam.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Gambar kedua
              Center(
                child: Image.asset(
                  '../assets/tutorial/keamanan2.png',  // Ganti dengan nama file gambar yang diinginkan
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Penutup',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Mendaki gunung adalah pengalaman yang menyenangkan sekaligus menantang. Persiapan yang matang dan sikap tanggung jawab terhadap alam sangat penting untuk menjadikan pendakian aman dan berkesan. Selamat mendaki!',
                    style: TextStyle(fontSize: 16),
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

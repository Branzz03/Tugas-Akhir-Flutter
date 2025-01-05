import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                backgroundColor: const Color(0xFF1565C0), // Warna biru navbar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Tentang Pendakian Kami',
        style: TextStyle(color: Colors.white), // Warna teks navbar
      ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar header
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '../assets/home/blog.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Judul Blog
              const Text(
                'Selamat Datang di Blog Pendakian Kami',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 8),

              // Paragraf pembuka
              const Text(
                'Pendakian adalah perjalanan untuk menyatu dengan alam. Kami hadir untuk membantu Anda menjelajahi keindahan pegunungan dengan panduan dan informasi terbaik.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Subjudul
              const Text(
                'Mengapa Memilih Panduan Pendakian Kami?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 8),

              // Poin-poin keunggulan
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.indigo),
                    title: Text('Panduan lengkap untuk pendaki pemula dan profesional'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.indigo),
                    title: Text('Tips keselamatan dan persiapan yang matang'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.indigo),
                    title: Text('Daftar rute pendakian populer dan tersembunyi'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.indigo),
                    title: Text('Komunitas pendaki untuk berbagi pengalaman'),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Paragraf penutup
              const Text(
                'Kami berkomitmen untuk mendukung perjalanan pendakian Anda. Terima kasih telah mempercayai panduan kami. Jangan lupa untuk tetap menjaga kelestarian alam di setiap langkah Anda.',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              // Tombol navigasi
              Center(
                child: ElevatedButton(
                  onPressed: () {
                   Navigator.pop(context); // Tambahkan navigasi di sini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Jelajahi Pendakian',
                    
                    style: TextStyle(fontSize: 16, color: Colors.white),
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

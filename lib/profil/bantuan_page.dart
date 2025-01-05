import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        backgroundColor: Colors.indigo.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat datang di halaman Bantuan!',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            const Text(
              'Di sini Anda dapat menemukan informasi terkait masalah atau pertanyaan yang sering diajukan.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            // Card untuk informasi lebih lanjut
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.help_outline, color: Colors.indigo),
                title: const Text(
                  'Apa itu Java Mountain?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Java Mountain adalah platform yang menyediakan berbagai informasi terkait Pendakian di daerah Jawa.',
                ),
              ),
            ),
            const SizedBox(height: 20),
            // FAQ Section
            const Text(
              'FAQ (Pertanyaan yang Sering Diajukan):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Bagaimana cara memesan tiket?'),
                    subtitle: const Text('Anda dapat memesan tiket melalui aplikasi dengan mengikuti langkah-langkah berikut...'),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Apa saja fitur aplikasi ini?'),
                    subtitle: const Text('Aplikasi ini menyediakan berbagai fitur seperti informasi tempat pendkian, pemesanan tiket, dan lainnya.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Bagaimana cara menghubungi customer service?'),
                    subtitle: const Text('Anda dapat menghubungi customer service melalui halaman Kontak di aplikasi.'),
                  ),
                                ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Apakah aplikasi ini tersedia di semua platform?'),
                    subtitle: const Text('Ya, aplikasi ini dapat diunduh di Google Play Store dan Apple App Store.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Apa yang harus dilakukan jika aplikasi tidak berjalan?'),
                    subtitle: const Text('Cobalah untuk memulai ulang aplikasi atau periksa koneksi internet Anda.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Apakah ada biaya untuk menggunakan aplikasi?'),
                    subtitle: const Text('Aplikasi ini gratis untuk diunduh dan digunakan, namun beberapa fitur mungkin memerlukan biaya.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Bagaimana cara mengubah bahasa dalam aplikasi?'),
                    subtitle: const Text('Anda dapat mengubah bahasa melalui pengaturan aplikasi di menu profil.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Bagaimana cara memperbarui aplikasi?'),
                    subtitle: const Text('Pastikan Anda memiliki koneksi internet yang stabil dan unduh versi terbaru dari Play Store atau App Store.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.indigo),
                    title: const Text('Dapatkah saya berbagi informasi dengan teman?'),
                    subtitle: const Text('Ya, Anda dapat membagikan tempat pendakian atau informasi lainnya melalui aplikasi media sosial atau tautan.'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Tombol kembali ke profil
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman Profil
                },
                icon: const Icon(Icons.arrow_back,
                color: Colors.white,),
                label: const Text('Kembali ke Profil',
                style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

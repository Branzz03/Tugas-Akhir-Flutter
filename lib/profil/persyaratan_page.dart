import 'package:flutter/material.dart';

class PersyaratanLayananPage extends StatelessWidget {
  const PersyaratanLayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Persyaratan Layanan',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade700,
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  const Center(
                    child: Text(
                      'Persyaratan Layanan Aplikasi Java Mountain',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      'Terakhir diperbarui: Januari 2025',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Divider(height: 30, thickness: 2, color: Colors.indigo),
                  _buildSection(
                    '1. Penerimaan Persyaratan',
                    'Dengan menggunakan aplikasi Java Mountain, Anda menyetujui untuk mematuhi persyaratan layanan ini. Jika Anda tidak menyetujui persyaratan ini, harap berhenti menggunakan aplikasi.',
                    Icons.handshake_outlined,
                  ),
                  _buildSection(
                    '2. Penggunaan Aplikasi',
                    'Aplikasi ini disediakan untuk membantu pengguna menemukan informasi wisata di Java Mountain. Pengguna tidak diperbolehkan menggunakan aplikasi ini untuk tujuan yang melanggar hukum atau merugikan pihak lain.',
                    Icons.app_registration_outlined,
                  ),
                  _buildSection(
                    '3. Hak Kekayaan Intelektual',
                    'Semua konten dalam aplikasi, termasuk teks, gambar, dan logo, adalah milik Java Mountain dan dilindungi oleh undang-undang hak cipta. Pengguna tidak diperbolehkan menggandakan, mendistribusikan, atau memodifikasi konten tanpa izin tertulis dari kami.',
                    Icons.copyright_outlined,
                  ),
                  _buildSection(
                    '4. Tanggung Jawab Pengguna',
                    'Pengguna bertanggung jawab atas aktivitas yang dilakukan dalam aplikasi ini. Kami tidak bertanggung jawab atas kerugian yang disebabkan oleh pelanggaran pengguna terhadap persyaratan layanan ini.',
                    Icons.security_outlined,
                  ),
                  _buildSection(
                    '5. Pembaruan Layanan',
                    'Kami berhak untuk memperbarui atau menghentikan layanan aplikasi kapan saja tanpa pemberitahuan sebelumnya. Kami akan melakukan upaya terbaik untuk memberitahukan pengguna tentang perubahan besar pada layanan.',
                    Icons.update_outlined,
                  ),
                  _buildSection(
                    '6. Pembatasan Tanggung Jawab',
                    'Java Mountain tidak bertanggung jawab atas kerugian langsung, tidak langsung, atau konsekuensial yang timbul dari penggunaan aplikasi ini. Pengguna menggunakan aplikasi ini atas risiko sendiri.',
                    Icons.warning_amber_outlined,
                  ),
                  _buildSection(
                    '7. Hubungi Kami',
                    'Jika Anda memiliki pertanyaan tentang persyaratan layanan ini, silakan hubungi kami melalui halaman Kontak di aplikasi.',
                    Icons.contact_mail_outlined,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back,
                      color: Colors.white,),
                      label: const Text('Kembali',
                      style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo.shade700,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.indigo.shade700),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

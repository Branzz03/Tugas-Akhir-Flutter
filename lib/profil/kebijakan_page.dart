import 'package:flutter/material.dart';

class KebijakanPrivasiPage extends StatefulWidget {
  const KebijakanPrivasiPage({super.key});

  @override
  State<KebijakanPrivasiPage> createState() => _KebijakanPrivasiPageState();
}

class _KebijakanPrivasiPageState extends State<KebijakanPrivasiPage> {
  final List<bool> _visible = List<bool>.generate(14, (_) => false);

  @override
  void initState() {
    super.initState();
    _showTextsSequentially();
  }

  void _showTextsSequentially() async {
    for (int i = 0; i < _visible.length; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        _visible[i] = true;
      });
    }
  }

  Widget _buildAnimatedText(String text, int index,
      {TextStyle? style, double marginTop = 20.0, IconData? icon}) {
    return AnimatedSlide(
      offset: _visible[index] ? Offset.zero : const Offset(-1, 0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        opacity: _visible[index] ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          margin: EdgeInsets.only(top: marginTop),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(icon, color: Colors.indigo.shade700),
                ),
              Expanded(child: Text(text, style: style)),
            ],
          ),
        ),
      ),
    );
  }

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
        title: const Text(
          'Kebijakan Privasi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildAnimatedText(
                'Kebijakan Privasi Aplikasi Java Mountain',
                0,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                icon: Icons.policy,
              ),
              _buildAnimatedText(
                'Terakhir diperbarui: Agustus 2024',
                1,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
                marginTop: 10.0,
                icon: Icons.update,
              ),
              const Divider(height: 30, thickness: 1),
              _buildAnimatedText(
                '1. Pengumpulan Informasi Pribadi',
                2,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                icon: Icons.person,
              ),
              _buildAnimatedText(
                'Kami mengumpulkan informasi pribadi seperti nama, email, dan data lokasi Anda ketika Anda menggunakan aplikasi Java Mountain. Data ini digunakan untuk menyediakan layanan yang lebih baik dan sesuai dengan kebutuhan pengguna.',
                3,
                style: const TextStyle(fontSize: 16),
              ),
              _buildAnimatedText(
                '2. Penggunaan Informasi',
                4,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                icon: Icons.image,
              ),
              _buildAnimatedText(
                'Informasi yang dikumpulkan akan digunakan untuk meningkatkan pengalaman pengguna dalam menggunakan aplikasi, memberikan rekomendasi tempat wisata, dan memperbaiki fitur aplikasi.',
                5,
                style: const TextStyle(fontSize: 16),
              ),
              _buildAnimatedText(
                '3. Keamanan Data',
                6,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                icon: Icons.lock,
              ),
              _buildAnimatedText(
                'Kami berkomitmen untuk menjaga keamanan data pribadi Anda. Kami menggunakan protokol keamanan terbaru untuk melindungi data dari akses yang tidak sah.',
                7,
                style: const TextStyle(fontSize: 16),
              ),
              _buildAnimatedText(
                '4. Pengungkapan kepada Pihak Ketiga',
                8,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                icon: Icons.share,
              ),
              _buildAnimatedText(
                'Kami tidak akan mengungkapkan informasi pribadi Anda kepada pihak ketiga tanpa izin Anda, kecuali jika diwajibkan oleh hukum atau untuk melindungi hak-hak kami.',
                9,
                style: const TextStyle(fontSize: 16),
              ),
              _buildAnimatedText(
                '5. Perubahan Kebijakan Privasi',
                10,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                icon: Icons.change_circle,
              ),
              _buildAnimatedText(
                'Kami dapat memperbarui kebijakan privasi ini dari waktu ke waktu. Setiap perubahan akan diumumkan melalui aplikasi, dan Anda akan diberi kesempatan untuk memeriksa kebijakan yang baru.',
                11,
                style: const TextStyle(fontSize: 16),
              ),
              _buildAnimatedText(
                '6. Hak Pengguna',
                12,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                icon: Icons.verified_user,
              ),
              _buildAnimatedText(
                'Anda memiliki hak untuk mengakses, memperbaiki, atau menghapus data pribadi yang kami miliki tentang Anda. Jika Anda ingin melakukan hal tersebut, silakan hubungi kami melalui halaman Kontak.',
                13,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Kembali',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
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
    );
  }
}

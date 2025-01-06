import 'package:flutter/material.dart';
import 'form_registration_page.dart'; // Import halaman registrasi

class RegistrationPagesumbing extends StatefulWidget {
  const RegistrationPagesumbing({super.key});

  @override
  State<RegistrationPagesumbing> createState() => _RegistrationPageStatesumbing();
}

class _RegistrationPageStatesumbing extends State<RegistrationPagesumbing> {
  bool isChecked = false; // Status untuk checkbox

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
          'Peraturan Mendaki',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // List Aturan Mendaki
            const Text(
              '1. Pendaki Wajib mengisi form Registrasi\n'
              '2. Wajib meninggalkan identitas dan diambil waktu turun\n'
              '3. Pendaki Wajib ikut briefing arahan petugas\n'
              '4. Dilarang membuat jalur sendiri\n'
              '5. Dilarang foto di tempat yang berbahaya\n'
              '6. Dilarang buang sampah sembarangan\n'
              '7. Dilarang Membawa Tisu Basah\n'
              '8. Dilarang membawa Speaker\n'
              '9. Sampah Wajib dibawa saat turun\n'
              '10. Dilarang Membuat Api Unggun\n'
              '11. Pendaki Wajib mengikuti aturan yang berlaku di base camp\n'
              '12. Pendaki Wajib Membawa/menunjukkan surat registrasi bukti pembayaran yang dikirim lewat email',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Informasi Jam Operasional
            const Text(
              'Jam Buka/Tutup Pos Perizinan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.access_time, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Pos Perizinan Buka 24 Jam',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Spacer(), // Mengisi ruang kosong di antara widget
            // Checkbox dan Tombol
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'Saya telah membaca, menyetujui, dan bersedia mengikuti semua peraturan SOP yang berlaku',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Tombol Selanjutnya
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isChecked
                    ? () {
                        // Aksi ketika tombol ditekan dan checkbox sudah dicentang
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormRegistrationPagesumbing(),
                          ),
                        );
                      }
                    : null, // Disable jika checkbox belum dicentang
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  disabledBackgroundColor: Colors.grey, // Warna saat disabled
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Selanjutnya',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

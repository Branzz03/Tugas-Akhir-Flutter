import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'personal_data_page.dart';  // Import untuk TextInputFormatter

class TravelFormRegistrationPagearjuno extends StatefulWidget {
  const TravelFormRegistrationPagearjuno({super.key});

  @override
  _TravelFormRegistrationPagearjunoState createState() =>
      _TravelFormRegistrationPagearjunoState();
}

class _TravelFormRegistrationPagearjunoState
    extends State<TravelFormRegistrationPagearjuno> {
  final TextEditingController lokasiPenjemputanController =
      TextEditingController();
  final TextEditingController lokasiTujuanController = TextEditingController();
  final TextEditingController waktuPenjemputanController =
      TextEditingController();
  final TextEditingController jumlahRombonganController =
      TextEditingController();
  final TextEditingController nomorTeleponController = TextEditingController();  // Controller untuk nomor telepon

  String? _selectedVehicle;

  // Daftar kendaraan dan gambar
  final List<Map<String, String>> _vehicles = [
    {'name': 'Mobil Travel A', 'image': '../assets/mobil1.png'},
    {'name': 'Mobil Travel B', 'image': '../assets/mobil2.png'},
    {'name': 'Mobil Travel C', 'image': '../assets/mobil3.png'},
    {'name': 'Mobil Travel D', 'image': '../assets/mobil4.png'},
  ];

  // Daftar basecamp Gunung Arjuno
  final List<String> _basecampList = [
    'Basecamp Tretes',
    'Basecamp Lawang',
    'Basecamp Sumber Brantas',
    'Basecamp Purwosari',
  ];

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
        title: const Text('Form Registrasi',
        style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Gambar Carousel
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(
                    '../assets/arjuno/arjuno1.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    '../assets/arjuno/arjuno2.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    '../assets/arjuno/arjuno3.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            // Bagian Informasi Gunung
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tiket Pendakian',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Gunung Arjuno',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Malang, Jawa Timur.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Gunung Arjuno merupakan salah satu gunung berapi yang terletak di Jawa Timur, Indonesia. '
                    'Gunung ini sangat populer di kalangan pendaki. Beberapa jalur pendakian yang bisa ditempuh untuk mencapai puncak Arjuno adalah melalui basecamp Tretes dan Lawang.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Form Input
                  _buildInputField(
                    controller: lokasiPenjemputanController,
                    labelText: 'Lokasi Penjemputan',
                  ),
                  const SizedBox(height: 16),
                  // Dropdown untuk Lokasi Tujuan
                  _buildDropdownField(
                    labelText: 'Lokasi Tujuan (Basecamp)',
                    value: lokasiTujuanController.text.isEmpty
                        ? null
                        : lokasiTujuanController.text,
                    items: _basecampList.map((basecamp) {
                      return DropdownMenuItem<String>(
                        value: basecamp,
                        child: Text(basecamp),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        lokasiTujuanController.text = newValue ?? '';
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Dropdown untuk kendaraan
                  _buildDropdownField(
                    labelText: 'Pilih Kendaraan',
                    value: _selectedVehicle,
                    items: _vehicles.map((vehicle) {
                      return DropdownMenuItem<String>(
                        value: vehicle['name'],
                        child: Row(
                          children: [
                            Image.asset(
                              vehicle['image']!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 10),
                            Text(vehicle['name']!),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedVehicle = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    controller: waktuPenjemputanController,
                    labelText: 'Waktu Penjemputan',
                    hintText: 'Misal: 10:00 AM',
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    controller: jumlahRombonganController,
                    labelText: 'Jumlah Rombongan',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika tombol lanjut
                      print("Kendaraan Dipilih: $_selectedVehicle");
              
                      // Pindah ke halaman pengisian data pribadi
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  PersonalDataFormPagearjuno()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Lanjutkan Isi Data',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi Helper untuk Membuat Input Field
  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }

  // Fungsi Helper untuk Dropdown Field dengan Gambar
  Widget _buildDropdownField({
    required String labelText,
    required List<DropdownMenuItem<String>> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}

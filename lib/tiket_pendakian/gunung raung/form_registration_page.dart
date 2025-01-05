import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'data_entry_page.dart';

class FormRegistrationPagemerbabu extends StatefulWidget {
  const FormRegistrationPagemerbabu({super.key});

  @override
  _FormRegistrationPageStatemerbabu createState() => _FormRegistrationPageStatemerbabu();
}

class _FormRegistrationPageStatemerbabu extends State<FormRegistrationPagemerbabu> {
  final List<String> basecampOptions = [
    'Basecamp Sumber Wringin',
    'Basecamp Kalibaru',
  ];

  DateTime? _selectedTanggalMasuk;
  DateTime? _selectedTanggalKeluar;
  int _jumlahRombongan = 1;

  Future<void> pickDate(BuildContext context, bool isTanggalMasuk) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isTanggalMasuk ? _selectedTanggalMasuk : _selectedTanggalKeluar)) {
      setState(() {
        if (isTanggalMasuk) {
          _selectedTanggalMasuk = picked;
        } else {
          _selectedTanggalKeluar = picked;
        }
      });
    }
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
          'Form Registrasi',
          style: TextStyle(color: Colors.white),
        ),
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
                    '../assets/raung/raung1.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    '../assets/raung/raung2.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    '../assets/raung/raung3.png',
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
                    'Gunung Raung',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Kabupaten Banyuwangi dan Bondowoso.',
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
                    'Gunung Raung adalah gunung berapi yang terletak di Jawa Timur. Gunung ini terkenal dengan jalur pendakian yang menantang dan pemandangan yang menakjubkan. Puncaknya menawarkan panorama luar biasa dengan kawah yang aktif.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Pos Perizinan Masuk',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pilih pos masuk',
                    ),
                    items: basecampOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Pos Perizinan Keluar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pilih pos keluar',
                    ),
                    items: basecampOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tanggal Masuk',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    readOnly: true,
                    onTap: () => pickDate(context, true),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: _selectedTanggalMasuk != null
                          ? DateFormat('dd-MM-yyyy').format(_selectedTanggalMasuk!)
                          : 'Masukkan tanggal masuk',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tanggal Keluar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    readOnly: true,
                    onTap: () => pickDate(context, false),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: _selectedTanggalKeluar != null
                          ? DateFormat('dd-MM-yyyy').format(_selectedTanggalKeluar!)
                          : 'Masukkan tanggal keluar',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Jumlah Rombongan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan jumlah rombongan',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _jumlahRombongan = int.tryParse(value) ?? 1;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataEntryPagemerbabu(jumlahRombongan: _jumlahRombongan),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      shadowColor: Colors.blueAccent.shade100,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                        const Text(
                          'Lanjutkan Isi Data',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
}

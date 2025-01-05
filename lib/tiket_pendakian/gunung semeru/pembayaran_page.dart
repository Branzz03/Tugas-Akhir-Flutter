import 'package:flutter/material.dart';
import 'pembayaran_berhasil.dart';

class PembayaranPagesemeru extends StatefulWidget {
  @override
  _PembayaranPagesemeruState createState() => _PembayaranPagesemeruState();
}

class _PembayaranPagesemeruState extends State<PembayaranPagesemeru> {
  String? _selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    '../assets/semeru/semeru2.png', // Ganti dengan URL gambar yang sesuai
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Registrasi Pendakian Gn. Sindoro',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Atas nama : Zaid Akmal'),
                      Text('Tanggal naik : 10 Agustus 2024'),
                      Text('Tanggal turun : 12 Agustus 2024'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Pilih Pembayaran:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      RadioListTile(
                        value: 'GOPAY',
                        groupValue: _selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value.toString();
                          });
                        },
                        title: const Text('GOPAY'),
                        activeColor: const Color(0xFF2575FC),
                      ),
                      RadioListTile(
                        value: 'DANA',
                        groupValue: _selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value.toString();
                          });
                        },
                        title: const Text('DANA'),
                        activeColor: const Color(0xFF2575FC),
                      ),
                      RadioListTile(
                        value: 'OVO',
                        groupValue: _selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value.toString();
                          });
                        },
                        title: const Text('OVO'),
                        activeColor: const Color(0xFF2575FC),
                      ),
                      RadioListTile(
                        value: 'ShopeePay',
                        groupValue: _selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value.toString();
                          });
                        },
                        title: const Text('ShopeePay'),
                        activeColor: const Color(0xFF2575FC),
                      ),
                      RadioListTile(
                        value: 'Basecamp',
                        groupValue: _selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value.toString();
                          });
                        },
                        title: const Text('Bayar di Basecamp'),
                        activeColor: const Color(0xFF2575FC),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_selectedPayment == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Pilih metode pembayaran terlebih dahulu!'),
                          ),
                        );
                        return;
                      }
                      // Arahkan ke halaman Pembayaran Berhasil setelah memilih metode pembayaran
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PembayaranBerhasilPagesemeru(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFF2575FC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    icon: const Icon(Icons.payment, size: 24, color: Colors.white),
                    label: const Text(
                      'Bayar',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

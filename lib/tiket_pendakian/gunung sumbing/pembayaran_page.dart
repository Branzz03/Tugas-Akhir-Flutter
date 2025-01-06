import 'package:flutter/material.dart';
import 'package:fti_outdor/home_screen.dart';

class PembayaranPagesumbing extends StatefulWidget {
  @override
  _PembayaranPagesumbingState createState() => _PembayaranPagesumbingState();
}

class _PembayaranPagesumbingState extends State<PembayaranPagesumbing> {
  String? _selectedPayment;

  // Fungsi untuk menampilkan dialog dengan efek animasi
  void _showOrderDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54, // Latar belakang transparan
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: animation,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 80,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Pesanan Diterima',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Pendaftaranmu sudah diterima dan untuk surat pendakian akan segera dikirim lewat EMAIL Anda. Santuy ya...',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Kembali',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pembayaran',
          style: TextStyle(color: Colors.white),
        ),
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
                    '../assets/sumbing/sumbing3.png', // Ganti dengan URL gambar yang sesuai
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
                      paymentOption(
                        value: 'GOPAY',
                        groupValue: _selectedPayment,
                        onChanged: (value) => setState(() {
                          _selectedPayment = value.toString();
                        }),
                        title: '',
                        imagePath: '../assets/icon/gopay.png',
                      ),
                      paymentOption(
                        value: 'DANA',
                        groupValue: _selectedPayment,
                        onChanged: (value) => setState(() {
                          _selectedPayment = value.toString();
                        }),
                        title: '',
                        imagePath: '../assets/icon/dana.png',
                      ),
                      paymentOption(
                        value: 'OVO',
                        groupValue: _selectedPayment,
                        onChanged: (value) => setState(() {
                          _selectedPayment = value.toString();
                        }),
                        title: '',
                        imagePath: '../assets/icon/ovo.png',
                      ),
                      paymentOption(
                        value: 'ShopeePay',
                        groupValue: _selectedPayment,
                        onChanged: (value) => setState(() {
                          _selectedPayment = value.toString();
                        }),
                        title: '',
                        imagePath: '../assets/icon/shope.png',
                      ),
                      paymentOption(
                        value: 'Basecamp',
                        groupValue: _selectedPayment,
                        onChanged: (value) => setState(() {
                          _selectedPayment = value.toString();
                        }),
                        title: '(Bayar di Basecamp)',
                        imagePath: '../assets/icon/basecamp.png',
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
                      // Tampilkan dialog pembayaran berhasil
                      _showOrderDialog(context);
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
                      style: TextStyle(fontSize: 18,  color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget paymentOption({
  required String value,
  required String? groupValue, // Tetap nullable
  required void Function(String?) onChanged,
  required String title,
  required String imagePath,
}) {
  return RadioListTile(
    value: value,
    groupValue: groupValue ?? '', // Pastikan tidak null
    onChanged: onChanged,
    title: Row(
      children: [
        Image.asset(imagePath, width: 100, height: 100),
        const SizedBox(width: 11),
        Text(title),
      ],
    ),
    activeColor: const Color(0xFF2575FC),
  );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fti_outdor/home_screen.dart';

class DetailPembayaran extends StatelessWidget {
  final Map<String, dynamic> product;

  const DetailPembayaran({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          product['name'],
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1565C0),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Card untuk menampilkan gambar produk
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: 'product-image-${product['name']}',
                  child: Image.asset(
                    product['image'], // Menampilkan gambar produk
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Nama produk
            Row(
              children: [
                const Icon(Icons.shopping_bag, color: Colors.indigo, size: 28),
                const SizedBox(width: 10),
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Harga produk
            Row(
              children: [
                const Icon(Icons.monetization_on, color: Colors.indigo, size: 28),
                const SizedBox(width: 10),
                Text(
                  "Rp.${NumberFormat('#,###', 'id_ID').format(product['price'])}",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Deskripsi produk
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.description, color: Colors.grey, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    product['description'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Tombol Bayar Sekarang
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormPembelian(product: product),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                ),
                icon: const Icon(Icons.payment, color: Colors.white),
                label: const Text(
                  "Beli Sekarang",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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

// Halaman Form Pembelian
class FormPembelian extends StatefulWidget {
  final Map<String, dynamic> product;

  const FormPembelian({Key? key, required this.product}) : super(key: key);

  @override
  _FormPembelianState createState() => _FormPembelianState();
}

class _FormPembelianState extends State<FormPembelian> {
  String _selectedPaymentMethod = '';

  final List<Map<String, String>> _paymentMethods = [
    {'label': 'COD', 'image': '../assets/icon/cod.png'},
    {'label': 'Bank Mandiri', 'image': '../assets/icon/mandiri.png'},
    {'label': 'BCA', 'image': '../assets/icon/bca.png'},
    {'label': 'BNI', 'image': '../assets/icon/bni.png'},
    {'label': 'DANA', 'image': '../assets/icon/dana.png'},
    {'label': 'Gopay', 'image': '../assets/icon/gopay.png'},
    {'label': 'ShopeePay', 'image': '../assets/icon/shope.png'},
  ];

  final Map<String, String> _accountDetails = {
    'Bank Mandiri': '1234-5678-9123',
    'BCA': '2345-6789-1234',
    'BNI': '3456-7891-2345',
    'DANA': '0812-3456-7890',
    'Gopay': '0812-3456-7890',
    'ShopeePay': '0812-3456-7890',
  };

  void _showInvoiceDialog(BuildContext context) {
    final accountNumber = _accountDetails[_selectedPaymentMethod] ?? "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, size: 60, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                "Pesanan Diterima",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Nama Barang: ${widget.product['name']}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Harga: Rp.${NumberFormat('#,###', 'id_ID').format(widget.product['price'])}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Pembayaran via: $_selectedPaymentMethod",
                style: const TextStyle(fontSize: 16),
              ),
              if (accountNumber.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  "No. Rekening: $accountNumber",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Atas Nama: Akmal",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Posisikan tombol di tengah
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()), // Ganti `HomePage` dengan widget homepage Anda
                    (route) => false, // Menghapus semua rute sebelumnya dari stack navigasi
                  );
                    },
                    icon: const Icon(Icons.print,
                    color: Colors.yellow,),
                    label: const Text("Cetak Tagihan (pdf)",
                    style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // Warna biru untuk tombol Cetak Tagihan
                      minimumSize: const Size(150, 50), // Ukuran tombol seragam
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Membuat sudut tombol melengkung
                      ),
                    ),
                  ),
                  const SizedBox(width: 20), // Memberi jarak horizontal 20px antara tombol
                  ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()), // Ganti `HomePage` dengan widget homepage Anda
                    (route) => false, // Menghapus semua rute sebelumnya dari stack navigasi
                  );
                },
                icon: const Icon(Icons.arrow_back,
                color: Colors.white,), // Ikon untuk tombol kembali
                label: const Text("Kembali",
                style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna merah untuk tombol Kembali
                  minimumSize: const Size(150, 50), // Ukuran tombol seragam
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Membuat sudut tombol melengkung
                  ),
                ),
              ),
                ],
              ),

            ],
          ),
        );
      },
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
        title: const Text('Form Pembelian Barang',
        style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset(
                  widget.product['image'],
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product['name'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rp.${NumberFormat('#,###', 'id_ID').format(widget.product['price'])}",
                      style: const TextStyle(fontSize: 16, color: Colors.indigo),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Isi Data Pembelian",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.home),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "No. Telepon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            const Text(
              "Pilih Metode Pembayaran",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _paymentMethods.map((method) {
                return ChoiceChip(
                  label: Image.asset(
                    method['image']!,
                    width: 80,
                    height: 80,
                  ),
                  selected: _selectedPaymentMethod == method['label'],
                  onSelected: (selected) {
                    setState(() {
                      _selectedPaymentMethod = selected ? method['label']! : '';
                    });
                  },
                  backgroundColor: Colors.grey[200],
                  selectedColor: Colors.indigo.shade100,
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedPaymentMethod.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Pilih metode pembayaran terlebih dahulu!")),
                    );
                  } else {
                    _showInvoiceDialog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                ),
                child: const Text(
                  "Kirim Pesanan",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
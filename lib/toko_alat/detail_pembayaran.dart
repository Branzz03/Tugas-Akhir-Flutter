import 'package:flutter/material.dart';

class DetailPembayaran extends StatelessWidget {
  final Map<String, dynamic> product;

  const DetailPembayaran({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: Colors.indigo,
        elevation: 0, // Menghilangkan bayangan pada app bar
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
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Nama produk
            Text(
              product['name'],
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Harga produk
            Text(
              "Rp.${product['price']}",
              style: const TextStyle(
                fontSize: 22,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),

            // Deskripsi produk
            Text(
              product['description'],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Bayar Sekarang
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pembayaran berhasil!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8, // Efek bayangan
                  animationDuration: const Duration(milliseconds: 300), // Animasi tombol
                ),
                child: const Text(
                  "Bayar Sekarang",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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

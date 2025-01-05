import 'package:flutter/material.dart';

class TokoAlatPage extends StatelessWidget {
  const TokoAlatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        "name": "Kompor Portable",
        "price": 55000,
        "image": "../assets/toko/kompor.png",
        "description": "Kompor kecil, cocok untuk camping.",
      },
      {
        "name": "Tas Hiking",
        "price": 550000,
        "image": "../assets/toko/tas.png",
        "description": "Tas besar, nyaman untuk perjalanan jauh.",
      },
      {
        "name": "Trekking Pole",
        "price": 139000,
        "image": "../assets/toko/tpole.png",
        "description": "Tongkat trekking ringan dan kuat.",
      },
      {
        "name": "Tenda Camping",
        "price": 1200000,
        "image": "../assets/toko/tenda.png",
        "description": "Tenda berkapasitas 4 orang, anti air.",
      },
      {
        "name": "Matras Lipat",
        "price": 40000,
        "image": "../assets/toko/matras.png",
        "description": "Matras ringan dan mudah dibawa.",
      },
      {
        "name": "Sepatu Hiking",
        "price": 650000,
        "image": "../assets/toko/sepatu.png",
        "description": "Sepatu hiking tahan air dan nyaman.",
      },
      {
        "name": "Senter LED",
        "price": 150000,
        "image": "../assets/toko/senter.png",
        "description": "Senter LED hemat energi.",
      },
      {
        "name": "Jaket Outdoor",
        "price": 1500000,
        "image": "../assets/toko/jakettnf.png",
        "description": "Jaket outdoor tahan angin dan hujan.",
      },
      {
        "name": "Paket Alat Makan",
        "price": 129000,
        "image": "../assets/toko/alatmakan.png",
        "description": "Paket lengkap alat makan yang sudah terdapat pisau,sendok, dan garpu.",
      },
      {
        "name": "Medkit Pouch",
        "price": 50000,
        "image": "../assets/toko/medkit.png",
        "description": "Pouch yang berisi medkit, dan mudah dibawa.",
      },
      {
        "name": "Yonex Nanoflare-001",
        "price": 957000,
        "image": "../assets/toko/yonex.png",
        "description": "Yonex Nanoflare dengan berat 70gr membuat pengalaman bermain anda menjadi lebih stabil.",
      },
      {
        "name": "Wadah Air fleksibel",
        "price": 30000,
        "image": "../assets/toko/air.png",
        "description": "Pouch air yang bisa dilipat, dan mudah dibawa.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo.shade700, Colors.indigo.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 3),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Cari produk...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('Semua', true),
                    _buildCategoryChip('Tenda', false),
                    _buildCategoryChip('Tas dan Sepatu', false),
                    _buildCategoryChip('Peralatan Masak', false),
                  ],
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.65,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(context, products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.indigo.shade700,
        backgroundColor: Colors.grey.shade200,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onSelected: (selected) {},
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(product: product),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Rp.${product['price']}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['description'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const PaymentPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "Harga: Rp.${product['price']}",
              style: const TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            const SizedBox(height: 16),
            Text(
              product['description'],
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementasi pembayaran bisa ditambahkan di sini
                },
                child: const Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
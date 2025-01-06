import 'package:flutter/material.dart';
import 'package:fti_outdor/toko_alat/detail_pembayaran.dart';
import 'package:intl/intl.dart';

class TokoAlatPage extends StatefulWidget {
  const TokoAlatPage({super.key});

  @override
  _TokoAlatPageState createState() => _TokoAlatPageState();
}

class _TokoAlatPageState extends State<TokoAlatPage> {
  final List<Map<String, dynamic>> products = [
   {
        "name": "Kompor Portable",
        "price": 55000,
        "image": "../assets/toko/kompor.png",
        "description": "Kompor kecil dan ringan, sangat cocok untuk kebutuhan camping Anda.",
        "category": "Peralatan Masak"
    },
    {
        "name": "Tas TNF 60L",
        "price": 100000,
        "image": "../assets/toko/tastnf.png",
        "description": "Tas TNF dengan kapasitas besar 60L, ideal untuk perjalanan jauh.",
        "category": "Tas dan Sepatu"
    },
    {
        "name": "Tas Eiger Equator 45L",
        "price": 1750000,
        "image": "../assets/toko/taseiger.png",
        "description": "Tas Eiger Equator 45L dirancang untuk mendukung perjalanan outdoor Anda dengan kenyamanan maksimal.",
        "category": "Tas dan Sepatu"
    },
    {
        "name": "Sepatu SNTA",
        "price": 308000,
        "image": "../assets/toko/snta.png",
        "description": "Sepatu SNTA yang nyaman, dirancang khusus untuk mendukung aktivitas pendakian Anda.",
        "category": "Tas dan Sepatu"
    },
    {
        "name": "Sepatu Consina",
        "price": 400000,
        "image": "../assets/toko/sepatuconsina.png",
        "description": "Sepatu Consina yang kokoh dan nyaman untuk perjalanan panjang.",
        "category": "Tas dan Sepatu"
    },
    {
        "name": "Trekking Pole",
        "price": 139000,
        "image": "../assets/toko/tpole.png",
        "description": "Trekking pole berkualitas tinggi, ringan, dan kuat untuk mendukung perjalanan outdoor Anda.",
        "category": "Perlengkapan"
    },
    {
        "name": "Tendaki Borneo 6",
        "price": 1200000,
        "image": "../assets/toko/tendaki.png",
        "description": "Tenda Borneo 6 berkapasitas 4 orang, dirancang tahan air dan mudah dipasang.",
        "category": "Tenda"
    },
    {
        "name": "Tenda Arei",
        "price": 1500000,
        "image": "../assets/toko/arei.png",
        "description": "Tenda Arei dengan kapasitas 4 orang, menggunakan material berkualitas dan tahan air.",
        "category": "Tenda"
    },
    {
        "name": "Tenda Eiger",
        "price": 2200000,
        "image": "../assets/toko/eiger.png",
        "description": "Tenda Eiger berkapasitas 2 orang, didesain tahan air dengan kualitas terbaik.",
        "category": "Tenda"
    },
    {
        "name": "Tenda Speeds",
        "price": 1000000,
        "image": "../assets/toko/speed.png",
        "description": "Tenda Speeds berkapasitas 2 orang, ringan dan tahan air tanpa double layer.",
        "category": "Tenda"
    },
    {
        "name": "Wadah Air Fleksibel",
        "price": 30000,
        "image": "../assets/toko/air.png",
        "description": "Pouch air fleksibel yang dapat dilipat, praktis untuk kebutuhan perjalanan.",
        "category": "Peralatan Masak"
    },
    {
        "name": "Paket Alat Makan",
        "price": 129000,
        "image": "../assets/toko/alatmakan.png",
        "description": "Paket alat makan lengkap dengan pisau, sendok, dan garpu, cocok untuk outdoor.",
        "category": "Peralatan Masak"
    },
    {
        "name": "Jaket Antarestar",
        "price": 300000,
        "image": "../assets/toko/antarestar.png",
        "description": "Jaket Antarestar tahan angin dan hujan, memberikan perlindungan maksimal.",
        "category": "Pakaian"
    },
    {
        "name": "Jaket Uniseks",
        "price": 150000,
        "image": "../assets/toko/uniseks.png",
        "description": "Jaket uniseks dengan desain simpel, tahan angin dan hujan untuk kegiatan outdoor.",
        "category": "Pakaian"
    },
    {
        "name": "Jaket Consina",
        "price": 250000,
        "image": "../assets/toko/Consina.png",
        "description": "Jaket Consina dirancang khusus untuk menghadapi kondisi cuaca ekstrem.",
        "category": "Pakaian"
    },
    {
        "name": "Celana TNF",
        "price": 180000,
        "image": "../assets/toko/tnf.png",
        "description": "Celana TNF tahan angin dan hujan, nyaman untuk petualangan outdoor.",
        "category": "Pakaian"
    },
    {
        "name": "Celana Mount AVO",
        "price": 120000,
        "image": "../assets/toko/avo.png",
        "description": "Celana Mount AVO dengan desain modern dan material tahan cuaca.",
        "category": "Pakaian"
    },
    {
        "name": "Celana Daftel",
        "price": 150000,
        "image": "../assets/toko/daftel.png",
        "description": "Celana Daftel yang tahan angin dan hujan, ideal untuk kegiatan outdoor.",
        "category": "Pakaian"
    },
    {
        "name": "Medkit Pouch",
        "price": 50000,
        "image": "../assets/toko/medkit.png",
        "description": "Medkit pouch yang praktis dan mudah dibawa, berisi perlengkapan medis dasar.",
        "category": "Perlengkapan"
    },
    {
        "name": "Matras Lipat",
        "price": 40000,
        "image": "../assets/toko/matras.png",
        "description": "Matras lipat ringan, nyaman, dan mudah dibawa ke mana saja.",
        "category": "Perlengkapan"
    }
  ];

  String selectedCategory = 'Semua';
  String searchText = '';
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> get filteredProducts {
    return products.where((product) {
      final matchesCategory = selectedCategory == 'Semua' || product['category'] == selectedCategory;
      final matchesSearch = product['name'].toLowerCase().contains(searchText.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
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
        title: const Text('Toko Alat Pendaki',
        style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'Cari produk...',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('Semua'),
                    _buildCategoryChip('Tenda'),
                    _buildCategoryChip('Tas dan Sepatu'),
                    _buildCategoryChip('Peralatan Masak'),
                    _buildCategoryChip('Pakaian'),                   
                     _buildCategoryChip('Perlengkapan'),
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
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return _buildProductCard(context, filteredProducts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        label: Text(label),
        selected: selectedCategory == label,
        selectedColor: Colors.indigo.shade700,
        backgroundColor: Colors.grey.shade200,
        labelStyle: TextStyle(
          color: selectedCategory == label ? Colors.white : Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onSelected: (selected) {
          setState(() {
            selectedCategory = label;
          });
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPembayaran(product: product),
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
                        "Rp.${NumberFormat('#,###', 'id_ID').format(product['price'])}",
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
import 'package:flutter/material.dart';
import 'porter_booking.dart';
import 'guide_booking.dart';

class PorterRegristationslamet extends StatefulWidget {
  const PorterRegristationslamet({super.key});

  @override
  _PorterRegistrationslametState createState() => _PorterRegistrationslametState();
}

class _PorterRegistrationslametState extends State<PorterRegristationslamet> {
  String selectedType = 'Porter'; // Default pilihan adalah Porter

  // Daftar nama porter dan guide
  final List<String> porterNames = [
    'Rian Saputra',
    'Ahmad Fauzi',
    'Dedi Kurniawan',
    'Bambang Setiawan',
    'Andi Wijaya'
  ];

  final List<String> guideNames = [
    'Siti Aminah',
    'Eko Prasetyo',
    'Rina Marlina',
    'Yusuf Firdaus',
    'Teguh Harianto'
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
        title: const Text(
          'Porter & Guide',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Informasi Gunung
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.indigo.shade200, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gunung Slamet',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ketinggian: 3.428 mdpl',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                    'Gunung Slamet adalah salah satu gunung berapi aktif terbesar di Jawa Tengah. Gunung ini memiliki beberapa jalur pendakian yang terkenal dan bisa dijadikan pilihan untuk pendaki, mulai dari jalur Garut, Bambangan, hingga Baturaden.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Judul Layanan
              const Text(
                'Layanan Porter dan Guide',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Deskripsi Layanan
              const Text(
                'Layanan porter dan guide kami memberikan pengalaman mendaki yang nyaman dan aman. Kami memiliki tim berpengalaman yang siap membantu Anda sepanjang perjalanan.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Tombol memilih porter dan guide
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedType = 'Porter'; // Pilihan Porter
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == 'Porter'
                          ? Colors.indigo.shade800
                          : Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Pilih Porter',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedType = 'Guide'; // Pilihan Guide
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == 'Guide'
                          ? Colors.indigo.shade800
                          : Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Pilih Guide',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Daftar Porter dan Guide
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5, // Jumlah daftar guide atau porter
                itemBuilder: (context, index) {
                  bool isAvailable = index % 2 == 0; // Indikasi ketersediaan
                  String name = selectedType == 'Porter'
                      ? porterNames[index]
                      : guideNames[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        isAvailable
                            ? 'Tersedia - Pengalaman 5 tahun mendaki.'
                            : 'Tidak tersedia saat ini.',
                        style: TextStyle(
                          fontSize: 14,
                          color: isAvailable ? Colors.green : Colors.red,
                        ),
                      ),
                      trailing: isAvailable
                      ? ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman detail porter atau guide
                            if (selectedType == 'Porter') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PorterDetailPageslamet(
                                    name: name,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GuideDetailPageslamet(
                                    name: name,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Pesan',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : const Icon(
                          Icons.block,
                          color: Colors.red,
                        ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'gunung sindoro/regristrasi_page_sindoro.dart'; // Halaman detail Gunung Sindoro
import 'gunung raung/regristrasi_page_merbabu.dart';
import 'gunung slamet/regristrasi_page_slamet.dart';
import 'gunung sumbing/regristrasi_page_sumbing.dart';
import 'gunung arjuno/regristrasi_page_arjuno.dart';
import 'gunung welirang/regristrasi_page_welirang.dart';
import 'gunung semeru/regristrasi_page_semeru.dart';
import 'gunung lawu/regristrasi_page_lawu.dart'; // Halaman detail Gunung Merbabu

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar gunung di Jawa Tengah beserta detailnya
    final List<Map<String, dynamic>> gunungJateng = [
      {
        'name': 'Gunung Sindoro',
        'lokasi': 'Kabupaten Temanggung dan Wonosobo',
        'image': '../assets/sindoro/sindoro1.png',
        'tarif': {
          'WNI': {'hariKerja': 20000, 'hariLibur': 25000},
          'WNA': {'hariKerja': 30000, 'hariLibur': 40000},
        },
      },
      {
        'name': 'Gunung Raung',
        'lokasi': 'Kabupaten Banyuwangi, Bondowoso, dan Jember',
        'image': '../assets/raung/raung1.png',
        'tarif': {
          'WNI': {'hariKerja': 25000, 'hariLibur': 200000},
          'WNA': {'hariKerja': 25000, 'hariLibur': 35000},
        },
      },      {
        'name': 'Gunung Slamet',
        'lokasi': 'Kabupaten Tegal,Pemalang, dan Brebes',
        'image': '../assets/slamet/slamet1.png',
        'tarif': {
          'WNI': {'hariKerja': 20000, 'hariLibur': 300000},
          'WNA': {'hariKerja': 25000, 'hariLibur': 35000},
        },
      },   {
        'name': 'Gunung Sumbing',
        'lokasi': 'Kabupaten Temanggung, Magelang, dan Wonosobo',
        'image': '../assets/sumbing/sumbing2.png',
        'tarif': {
          'WNI': {'hariKerja': 15000, 'hariLibur': 20000},
          'WNA': {'hariKerja': 25000, 'hariLibur': 35000},
        },
      }, {
        'name': 'Gunung Arjuno',
        'lokasi': 'Kabupaten Pasuruan dan Malang',
        'image': '../assets/arjuno/arjuno3.png',
        'tarif': {
          'WNI': {'hariKerja': 15000, 'hariLibur': 20000},
          'WNA': {'hariKerja': 25000, 'hariLibur': 35000},
        },
      },{
        'name': 'Gunung Welirang',
        'lokasi': 'Kabupaten Mojokerto dan Malang',
        'image': '../assets/welirang/welirang1.png',
        'tarif': {
          'WNI': {'hariKerja': 15000, 'hariLibur': 20000},
          'WNA': {'hariKerja': 25000, 'hariLibur': 35000},
        },
      },{
        'name': 'Gunung Semeru',
        'lokasi': 'Kabupaten Lumajang dan Malang',
        'image': '../assets/semeru/semeru2.png',
        'tarif': {
          'WNI': {'hariKerja': 15000, 'hariLibur': 20000},
          'WNA': {'hariKerja': 25000, 'hariLibur': 35000},
        },
      },{
        'name': 'Gunung Lawu',
        'lokasi': 'Kabupaten Karanganyar dan Magetan',
        'image': '../assets/lawu/lawu3.png',
        'tarif': {
          'WNI': {'hariKerja': 30000, 'hariLibur': 20000},
          'WNA': {'hariKerja': 25000, 'hariLibur': 35000},
        },
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pemesanan Tiket',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: gunungJateng.length,
        itemBuilder: (context, index) {
          final gunung = gunungJateng[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail berdasarkan gunung
                if (gunung['name'] == 'Gunung Sindoro') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPagesindoro()),
                  );
                } else if (gunung['name'] == 'Gunung Raung') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPagemerbabu()),
                  );
                }   else if (gunung['name'] == 'Gunung Sumbing') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPagesumbing()),
                  );
                }   else if (gunung['name'] == 'Gunung Slamet') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPageslamet()),
                  );
                }  else if (gunung['name'] == 'Gunung Arjuno') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPagearjuno()),
                  );
                }else if (gunung['name'] == 'Gunung Welirang') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPagewelirang()),
                  );
                }else if (gunung['name'] == 'Gunung Semeru') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPagesemeru()),
                  );
                }else if (gunung['name'] == 'Gunung Lawu') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPagelawu()),
                  );
                }
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        gunung['image'],
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gunung['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            gunung['lokasi'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Tarif Hari Kerja (WNI): Rp${gunung['tarif']['WNI']['hariKerja']}'),
                                  Text(
                                      'Tarif Hari Libur (WNI): Rp${gunung['tarif']['WNI']['hariLibur']}'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Tarif Hari Kerja (WNA): Rp${gunung['tarif']['WNA']['hariKerja']}'),
                                  Text(
                                      'Tarif Hari Libur (WNA): Rp${gunung['tarif']['WNA']['hariLibur']}'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

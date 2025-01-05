import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'gunung sindoro/registation_page.dart'; // Halaman detail Gunung Sindoro
import 'gunung sumbing/registation_page.dart';
import 'gunung slamet/registation_page.dart';
import 'gunung lawu/registation_page.dart';
import 'gunung arjuno/registation_page.dart';
import 'gunung welirang/registation_page.dart';
import 'gunung raung/registation_page.dart';
import 'gunung semeru/registation_page.dart'; // Halaman detail Gunung Merbabu

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>( 
      begin: const Offset(-1.0, 0.0), 
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward(); // Mulai animasi saat halaman dimuat
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // NumberFormat untuk format angka
    final numberFormat = NumberFormat('#.###');

    final List<Map<String, dynamic>> gunungJateng = [
      {
        'name': 'Gunung Sindoro',
        'lokasi': 'Kabupaten Temanggung dan Wonosobo',
        'image': '../assets/sindoro/sindoro1.png',
        'ketinggian': 3150, // dalam meter
      },
      {
        'name': 'Gunung Sumbing',
        'lokasi': 'Kabupaten Temanggung, Magelang, dan Wonosobo',
        'image': '../assets/sumbing/sumbing2.png',
        'ketinggian': 3371,
      },
      {
        'name': 'Gunung Slamet',
        'lokasi': 'Kabupaten Tegal, Pemalang, dan Brebes',
        'image': '../assets/slamet/slamet1.png',
        'ketinggian': 3428,
      },
      {
        'name': 'Gunung Lawu',
        'lokasi': 'Kabupaten Karanganyar dan Magetan',
        'image': '../assets/lawu/lawu3.png',
        'ketinggian': 3265,
      },
      {
        'name': 'Gunung Arjuno',
        'lokasi': 'Kabupaten Pasuruan dan Malang',
        'image': '../assets/arjuno/arjuno3.png',
        'ketinggian': 3339,
      },
      {
        'name': 'Gunung Welirang',
        'lokasi': 'Kabupaten Mojokerto dan Malang',
        'image': '../assets/welirang/welirang1.png',
        'ketinggian': 3156,
      },
      {
        'name': 'Gunung Raung',
        'lokasi': 'Kabupaten Banyuwangi, Bondowoso, dan Jember',
        'image': '../assets/raung/raung1.png',
        'ketinggian': 3332,
      },
      {
        'name': 'Gunung Semeru',
        'lokasi': 'Kabupaten Lumajang dan Malang',
        'image': '../assets/semeru/semeru2.png',
        'ketinggian': 3676,
      },
    ];

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
          'Pemesanan Travel',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
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
                        builder: (context) => const TravelFormRegistrationPagesindoro()),
                  );
                } else if (gunung['name'] == 'Gunung Sumbing') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelFormRegistrationPagesumbing()),
                  );
                } else if (gunung['name'] == 'Gunung Lawu') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelFormRegistrationPagelawu()),
                  );
                } else if (gunung['name'] == 'Gunung Slamet') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelFormRegistrationPageslamet()),
                  );
                } else if (gunung['name'] == 'Gunung Arjuno') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelFormRegistrationPagearjuno()),
                  );
                } else if (gunung['name'] == 'Gunung Welirang') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelFormRegistrationPagewelirang()),
                  );
                } else if (gunung['name'] == 'Gunung Raung') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelFormRegistrationPageraung()),
                  );
                } else if (gunung['name'] == 'Gunung Semeru') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelFormRegistrationPagesemeru()),
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
                          SlideTransition(
                            position: _offsetAnimation,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.landscape,
                                  color: Colors.blueAccent,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Ketinggian: ${numberFormat.format(gunung['ketinggian'])} MDPL',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
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
            ),
          );
        },
      ),
    );
  }
}
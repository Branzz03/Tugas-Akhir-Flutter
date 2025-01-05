import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'gunung sindoro/weater_information.dart';
import 'gunung arjuno/weater_information.dart';
import 'gunung lawu/weater_information.dart';
import 'gunung semeru/weater_information.dart';
import 'gunung slamet/weater_information.dart';
import 'gunung welirang/weater_information.dart';
import 'gunung sumbing/weater_information.dart';
import 'gunung raung/weater_information.dart'; // Halaman detail Gunung Merbabu

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> with SingleTickerProviderStateMixin {
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
        'suhu': '5 - 15 °C',
      },
      {
        'name': 'Gunung Sumbing',
        'lokasi': 'Kabupaten Temanggung, Magelang, dan Wonosobo',
        'image': '../assets/sumbing/sumbing2.png',
        'ketinggian': 3371,
        'suhu': '4 - 14 °C',
      },
      {
        'name': 'Gunung Slamet',
        'lokasi': 'Kabupaten Tegal, Pemalang, dan Brebes',
        'image': '../assets/slamet/slamet1.png',
        'ketinggian': 3428,
        'suhu': '2 - 12 °C',
      },
      {
        'name': 'Gunung Lawu',
        'lokasi': 'Kabupaten Karanganyar dan Magetan',
        'image': '../assets/lawu/lawu3.png',
        'ketinggian': 3265,
        'suhu': '3 - 13 °C',
      },
      {
        'name': 'Gunung Arjuno',
        'lokasi': 'Kabupaten Pasuruan dan Malang',
        'image': '../assets/arjuno/arjuno3.png',
        'ketinggian': 3339,
        'suhu': '3 - 14 °C',
      },
      {
        'name': 'Gunung Welirang',
        'lokasi': 'Kabupaten Mojokerto dan Malang',
        'image': '../assets/welirang/welirang1.png',
        'ketinggian': 3156,
        'suhu': '4 - 15 °C',
      },
      {
        'name': 'Gunung Raung',
        'lokasi': 'Kabupaten Banyuwangi, Bondowoso, dan Jember',
        'image': '../assets/raung/raung1.png',
        'ketinggian': 3332,
        'suhu': '5 - 16 °C',
      },
      {
        'name': 'Gunung Semeru',
        'lokasi': 'Kabupaten Lumajang dan Malang',
        'image': '../assets/semeru/semeru2.png',
        'ketinggian': 3676,
        'suhu': '0 - 10 °C',
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
          'Informasi Cuaca',
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
                        builder: (context) => const WeatherInformationsindoro()),
                  );
                } else if (gunung['name'] == 'Gunung Sumbing') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherInformationsumbing()),
                  );
                } else if (gunung['name'] == 'Gunung Lawu') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherInformationlawu()),
                  );
                } else if (gunung['name'] == 'Gunung Slamet') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherInformationslamet()),
                  );
                } else if (gunung['name'] == 'Gunung Arjuno') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherInformationarjuno()),
                  );
                } else if (gunung['name'] == 'Gunung Welirang') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherInformationwelirang()),
                  );
                } else if (gunung['name'] == 'Gunung Raung') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherInformationraung()),
                  );
                } else if (gunung['name'] == 'Gunung Semeru') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherInformationsemeru()),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
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
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.thermostat,
                                      color: Colors.redAccent,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Suhu: ${gunung['suhu']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
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

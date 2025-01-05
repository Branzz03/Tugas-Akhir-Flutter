import 'package:flutter/material.dart';
import 'gunung arjuno/regristation_page.dart'; // Import Gunung Arjuno RegistrationPage
import 'gunung raung/regristation_page.dart'; // Import Gunung Raung RegistrationPage
import 'gunung sindoro/regristation_page.dart'; // Import Gunung Sindoro RegistrationPage
import 'gunung slamet/regristation_page.dart'; // Import Gunung Slamet RegistrationPage
import 'gunung sumbing/regristation_page.dart'; // Import Gunung Sumbing RegistrationPage

class OpenTripPage extends StatefulWidget {
  const OpenTripPage({super.key});

  @override
  _OpenTripPageState createState() => _OpenTripPageState();
}

class _OpenTripPageState extends State<OpenTripPage> {
  String currentTripName = 'Gunung Arjuno';
  String currentTripDate = '25 - 28 Desember 2024';
  String currentTripPrice = 'Rp. 1.500.000/orang';
  String currentTripImage = '../assets/arjuno/arjuno1.png';

  final List<Map<String, String>> otherTrips = [
    {'name': 'Gunung Raung', 'price': 'Rp. 2.000.000/orang', 'image': '../assets/raung/raung2.png'},
    {'name': 'Gunung Sindoro', 'price': 'Rp. 2.500.000/orang', 'image': '../assets/sindoro/sindoro1.png'},
    {'name': 'Gunung Slamet', 'price': 'Rp. 1.800.000/orang', 'image': '../assets/slamet/slamet2.png'},
    {'name': 'Gunung Sumbing', 'price': 'Rp. 1.000.000/orang', 'image': '../assets/sumbing/sumbing2.png'},
  ];

  void updateTrip(String name, String date, String price, String image) {
    setState(() {
      otherTrips.add({
        'name': currentTripName,
        'price': currentTripPrice,
        'image': currentTripImage,
      });

      currentTripName = name;
      currentTripDate = date;
      currentTripPrice = price;
      currentTripImage = image;

      otherTrips.removeWhere((trip) => trip['name'] == name);
    });
  }

  void navigateToRegistrationPage(BuildContext context) {
    switch (currentTripName) {
      case 'Gunung Arjuno':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationPagearjuno(tripName: '',),
          ),
        );
        break;
      case 'Gunung Raung':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationPageraung(tripName: '',),
          ),
        );
        break;
      case 'Gunung Sindoro':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationPagesindoro(tripName: '',),
          ),
        );
        break;
      case 'Gunung Slamet':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationPageslamet(tripName: '',),
          ),
        );
        break;
      case 'Gunung Sumbing':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationPagesumbing(tripName: '',),
          ),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Trip'),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade700,
        elevation: 12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      currentTripImage,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentTripName,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Tanggal: $currentTripDate'),
                        const SizedBox(height: 8),
                        Text('Harga: $currentTripPrice'),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Warna latar tombol // Warna teks saat tombol ditekan
                          ),
                          onPressed: () => navigateToRegistrationPage(context),
                          child: const Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                              color: Colors.white, // Warna teks tombol
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Trip Lainnya',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: otherTrips.length,
              itemBuilder: (context, index) {
                final trip = otherTrips[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(trip['image']!),
                    ),
                    title: Text('${trip['name']} Open Trip'),
                    subtitle: Text('Harga: ${trip['price']}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      updateTrip(
                        trip['name']!,
                        'Tanggal: 1 - 5 Januari 2025', // Contoh tanggal
                        trip['price']!,
                        trip['image']!,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

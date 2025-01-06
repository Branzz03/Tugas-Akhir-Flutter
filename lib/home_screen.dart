import 'package:flutter/material.dart';
import 'package:fti_outdor/blog/blog_page.dart';
import 'package:fti_outdor/event/event.dart';
import 'package:fti_outdor/keamanan/keamanan_page.dart';
import 'tiket_pendakian/ticket_page.dart'; 
import 'travel_pendakian/travel_page.dart';
import 'toko_alat/sewa_page.dart';
import 'transaksi/transaction_page.dart'; 
import 'profil/profile_page.dart';
import 'porter_guide/porter_guidde_page.dart';
import 'open_trip/open_trip_page.dart';
import 'cuaca/weather_page.dart';
import 'eat dan stay/eat_and_stay_page.dart';
import 'camping/camping_page.dart';
import 'tutorial/tutorial_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              '../assets/logo.png', // Path logo
              height: 40, // Ukuran tinggi logo
            ),
            const SizedBox(width: 10), // Jarak antara logo dan teks
            const Text(
              'JAVA MOUNTAIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade700,
           automaticallyImplyLeading: false,
        elevation: 12,
        shadowColor: Colors.indigo.withOpacity(0.7),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Header
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('../assets/gunung1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  left: 16,
                  bottom: 16,
                  child: Text(
                    'Halo Akmal.., mau mendaki kemana besok?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Grid Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildMenuItem(context, Icons.airplane_ticket_rounded, 'Tiket Pendakian', const TicketPage()),
                  _buildMenuItem(context, Icons.directions_car_filled_rounded, 'Travel & Ojek', const TravelPage()),
                  _buildMenuItem(context, Icons.hiking_rounded, 'Porter & Guide',  const PorterGuiddePage()),
                  _buildMenuItem(context, Icons.handyman_rounded, 'Toko Alat', const TokoAlatPage()),
                  _buildMenuItem(context, Icons.group_outlined, 'Open Trip',  OpenTripPage()),
                  _buildMenuItem(context, Icons.restaurant_rounded, 'Eat and Stay', const EatAndStayPage()),
                  _buildMenuItem(context, Icons.emoji_people_rounded, 'Camping', const CampingPage()),
                  _buildMenuItem(context, Icons.event_rounded, 'Event', const EventPage()),
                ],
              ),
            ),

            // Promo
// Bagian Promo dengan Gambar Header
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo.shade600, Colors.blue.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 2,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('../assets/gunung1.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Promo Meriah Mendaki Lebih Hemat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nikmati diskon hingga 50% untuk pendakian pilihan!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

// Bagian Pantau Kondisi Gunung dengan Ikon-Ikon Informasi
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 2,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pantau Kondisi Gunung Sebelum Mendaki',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _InfoCard(Icons.cloud_queue_rounded, 'Cuaca'),
                      _InfoCard(Icons.map_rounded, 'Keamanan'),
                      _InfoCard(Icons.book_online_rounded, 'Blog'),
                      _InfoCard(Icons.help_center_rounded, 'Tutorial'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
bottomNavigationBar: BottomNavigationBar(
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.receipt_long_rounded),
      label: 'Transaksi',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: 'Profil',
    ),
  ],
  unselectedItemColor: Colors.blueGrey,
  showUnselectedLabels: true,
  currentIndex: 0, // Indeks halaman aktif
  onTap: (index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransactionPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  },
),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, Widget? page) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.indigo.shade700],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(icon, size: 36, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _InfoCard(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
        return InkWell(
      onTap: () {
        if (title == 'Cuaca') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WeatherPage()),
          );
        } else if (title == 'Tutorial') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TutorialPage()),
          );
        } else if (title == 'Blog') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BlogPage()),
          );
        } else if (title == 'Keamanan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CompassPage()),
          );
        }
        // Tambahkan navigasi lain jika diperlukan untuk title lainnya
      },
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent.shade200, Colors.indigo.shade500],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                color: Colors.black26,
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(icon, size: 40, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    )
        );
  }
}
import 'package:flutter/material.dart';
import 'package:fti_outdor/home_screen.dart';
import 'package:fti_outdor/login_screen.dart';
import 'package:fti_outdor/profil/bantuan_page.dart';
import 'package:fti_outdor/profil/kebijakan_page.dart';
import 'package:fti_outdor/profil/persyaratan_page.dart';
import 'package:fti_outdor/profil/profil_detail_page.dart';
import 'package:fti_outdor/transaksi/transaction_page.dart';

// ValueNotifiers to share user data across screens
final ValueNotifier<String> userName = ValueNotifier<String>('Zaid Ikmil');
final ValueNotifier<String> userEmail = ValueNotifier<String>('zaidakmal@gmail.com');

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo.shade700,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas profil
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('../assets/profil/bg_profil.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage('../assets/logo.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<String>(
              valueListenable: userName,
              builder: (context, value, _) {
                return Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            ValueListenableBuilder<String>(
              valueListenable: userEmail,
              builder: (context, value, _) {
                return Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileDetailPage(
                      nama: userName,
                      email: userEmail,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: const Icon(Icons.account_circle, color: Colors.white),
              label: const Text(
                'Lihat Profil Saya',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.help_outline, color: Colors.indigo.shade700),
                      title: const Text('Bantuan'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BantuanPage()),
                        );
                      },
                    ),
                    Divider(color: Colors.grey.shade300),
                    ListTile(
                      leading: Icon(Icons.privacy_tip_outlined, color: Colors.indigo.shade700),
                      title: const Text('Kebijakan Privasi'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const KebijakanPrivasiPage()),
                        );
                      },
                    ),
                    Divider(color: Colors.grey.shade300),
                    ListTile(
                      leading: Icon(Icons.description_outlined, color: Colors.indigo.shade700),
                      title: const Text('Persyaratan Layanan'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PersyaratanLayananPage()),
                        );
                      },
                    ),
                    Divider(color: Colors.grey.shade300),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: const Text('Logout', style: TextStyle(color: Colors.red)),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginRegisterScreen()),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                const Text(
                  'Versi Aplikasi: 1.0.0',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                const Image(
                  image: AssetImage('../assets/logo.png'),
                  height: 80,
                ),
              ],
            ),
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
        currentIndex: 2,
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
          }
        },
      ),
    );
  }
}

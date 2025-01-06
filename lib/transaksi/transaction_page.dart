import 'package:flutter/material.dart';
import 'package:fti_outdor/home_screen.dart';
import 'package:fti_outdor/profil/profile_page.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaksi',
          style: TextStyle(color: Colors.white,),
        ),
        backgroundColor: Colors.indigo.shade700,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          // Transaction List
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Just an example, replace with dynamic data
              itemBuilder: (context, index) {
                return TransactionCard(
                  date: '12 Desember 2024',
                  amount: 'Rp 500.000',
                  status: 'Selesai',
                );
              },
            ),
          ),
        ],
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
        currentIndex: 1, // Indeks halaman aktif
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
}

class TransactionCard extends StatelessWidget {
  final String date;
  final String amount;
  final String status;

  const TransactionCard({
    required this.date,
    required this.amount,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.indigo.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.indigo.shade100,
            child: Icon(
              Icons.payment,
              color: Colors.indigo.shade700,
            ),
          ),
          title: Text(
            'Transaksi: $date',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'Jumlah: $amount\nStatus: $status',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.indigo,
            ),
          ),
          onTap: () {
            // Optionally, navigate to transaction detail page
          },
        ),
      ),
    );
  }
}

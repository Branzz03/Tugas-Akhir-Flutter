import 'package:flutter/material.dart';
import 'data_form_page.dart';
import 'pilih_ketua_page.dart';

class DataEntryPagearjuno extends StatefulWidget {
  final int jumlahRombongan;

  const DataEntryPagearjuno({super.key, required this.jumlahRombongan,});

  @override
  _DataEntryPageStatearjuno createState() => _DataEntryPageStatearjuno();
}

class _DataEntryPageStatearjuno extends State<DataEntryPagearjuno> {
  List<Map<String, String?>> _passengerData = [];

  @override
  void initState() {
    super.initState();
    _initializePassengerData();
  }

  void _initializePassengerData() {
    _passengerData = List.generate(
      widget.jumlahRombongan,
      (_) => {
        'name': null,
        'email': null,
        'nik': null,
        'phone': null,
        'disease': null,
        'nationality': 'WNI',
        'gender': 'Laki-laki',
      },
    );
  }

  Future<void> _navigateToFormPage(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataFormPagearjuno(initialData: _passengerData[index]),
      ),
    );

    if (result != null) {
      setState(() {
        _passengerData[index] = result;
      });
    }
  }

  bool _isDataFilled() {
    return _passengerData.every((data) => data['name'] != null && data['email'] != null && data['nik'] != null && data['phone'] != null);
  }

void _navigateToPilihKetuaPage() {
  if (_isDataFilled()) {
    // Extract names from _passengerData for teamMembersList
    final teamMembersList = _passengerData.map((data) => data['name']!).toList();
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PilihKetuaPagearjuno(teamMembers: teamMembersList),
      ),
    );
  } else {
    // Optional: Show a warning if data is not filled
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in all required data before proceeding.')),
    );
  }
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
        title: const Text(
          'Isi Data Pemesan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(8),
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
                  const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 30),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Pengisian data harus sesuai identitas. Data yang tidak sesuai tidak terlindungi asuransi.',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: widget.jumlahRombongan,
                itemBuilder: (context, index) {
                  final passenger = _passengerData[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person, color: Colors.blueAccent, size: 30),
                            const SizedBox(width: 10),
                            Text(
                              passenger['name'] ?? 'Data Pemesan ${index + 1}',
                              style: const TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        TextButton.icon(
                          onPressed: () => _navigateToFormPage(index),
                          icon: Icon(
                            passenger['name'] == null ? Icons.edit : Icons.check_circle,
                            color: Colors.blueAccent,
                          ),
                          label: Text(
                            passenger['name'] == null ? 'Isi Data' : 'Edit Data',
                            style: const TextStyle(
                              fontFamily: 'Arial',
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: _isDataFilled() ? _navigateToPilihKetuaPage : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              label: const Text(
                'Lanjutkan Pilih Ketua',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

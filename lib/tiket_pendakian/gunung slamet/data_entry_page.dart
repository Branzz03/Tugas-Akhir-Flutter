import 'package:flutter/material.dart';
import 'data_form_page.dart';
import 'pilih_ketua_page.dart';

class DataEntryPageslamet extends StatefulWidget {
  final int jumlahRombongan;

  const DataEntryPageslamet({super.key, required this.jumlahRombongan,});

  @override
  _DataEntryPageStateslamet createState() => _DataEntryPageStateslamet();
}

class _DataEntryPageStateslamet extends State<DataEntryPageslamet> {
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
        builder: (context) => DataFormPageslamet(initialData: _passengerData[index]),
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
        builder: (context) => PilihKetuaPageslamet(teamMembers: teamMembersList),
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
    title: const Text(
      'Isi Data Pemesan',
        style: TextStyle(color: Colors.white), // Mengubah warna teks menjadi putih
      ),
      backgroundColor: Colors.blueAccent,
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
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Pengisian data harus sesuai identitas apabila tidak sesuai dengan identitas tidak terlindungi asuransi',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.black,
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
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          passenger['name'] ?? 'Data Pemesan ${index + 1}',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () => _navigateToFormPage(index),
                          child: Text(
                            passenger['name'] == null ? 'Isi Data' : 'Edit Data',
                            style: const TextStyle(
                              fontFamily: 'Arial',
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _isDataFilled() ? _navigateToPilihKetuaPage : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
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

import 'package:flutter/material.dart';
import 'pembayaran_page.dart';

class PilihKetuaPagesemeru extends StatefulWidget {
  final List<String> teamMembers;

  const PilihKetuaPagesemeru({Key? key, required this.teamMembers}) : super(key: key);

  @override
  _PilihKetuaPageStatesemeru createState() => _PilihKetuaPageStatesemeru();
}

class _PilihKetuaPageStatesemeru extends State<PilihKetuaPagesemeru> {
  String? _selectedKetua;

  void _selectKetua(String name) {
    setState(() {
      _selectedKetua = name;
    });
  }

  void _lanjutkanKePembayaran() {
    if (_selectedKetua != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PembayaranPagesemeru(),
        ),
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
          'Pilih Ketua',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Pilih salah satu anggota tim sebagai ketua:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.teamMembers.length,
                  itemBuilder: (context, index) {
                    final memberName = widget.teamMembers[index];
                    final isSelected = _selectedKetua == memberName;

                    return GestureDetector(
                      onTap: () => _selectKetua(memberName),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue[900] : Colors.blue[200],
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          border: isSelected
                              ? Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.blue[400],
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                memberName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _selectedKetua != null ? _lanjutkanKePembayaran : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: _selectedKetua != null ? Colors.blueAccent : Colors.blue[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.payment,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Lanjutkan ke Pembayaran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
  }
}

import 'package:flutter/material.dart';

class DataFormPageslamet extends StatefulWidget {
  final Map<String, String?> initialData;

  const DataFormPageslamet({super.key, required this.initialData});

  @override
  _DataFormPageStateslamet createState() => _DataFormPageStateslamet();
}

class _DataFormPageStateslamet extends State<DataFormPageslamet> {
  late TextEditingController _emailController;
  late TextEditingController _namaLengkapController;
  late TextEditingController _nikController;
  late TextEditingController _nomorTeleponController;
  late TextEditingController _penyakitController;

  String? _selectedNationality;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialData['email']);
    _namaLengkapController = TextEditingController(text: widget.initialData['name']);
    _nikController = TextEditingController(text: widget.initialData['nik']);
    _nomorTeleponController = TextEditingController(text: widget.initialData['phone']);
    _penyakitController = TextEditingController(text: widget.initialData['disease']);
    _selectedNationality = widget.initialData['nationality'];
    _selectedGender = widget.initialData['gender'];
  }

  @override
  void dispose() {
    _emailController.dispose();
    _namaLengkapController.dispose();
    _nikController.dispose();
    _nomorTeleponController.dispose();
    _penyakitController.dispose();
    super.dispose();
  }

  void _submitData() {
    Navigator.pop(context, {
      'name': _namaLengkapController.text,
      'email': _emailController.text,
      'nik': _nikController.text,
      'phone': _nomorTeleponController.text,
      'disease': _penyakitController.text,
      'nationality': _selectedNationality,
      'gender': _selectedGender,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengisian Data', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Email', 'Masukkan Email', _emailController),
              const SizedBox(height: 16),
              _buildTextField('Nama Lengkap', 'Masukkan Nama Lengkap', _namaLengkapController),
              const SizedBox(height: 16),
              _buildTextField('NIK KTP', 'Masukkan NIK KTP', _nikController),
              const SizedBox(height: 16),
              _buildTextField('Nomor Telepon/WA', 'Masukkan Nomor Telepon/WA', _nomorTeleponController),
              const SizedBox(height: 16),
              const Text('Kewarganegaraan'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('WNI'),
                      value: 'WNI',
                      groupValue: _selectedNationality,
                      onChanged: (value) {
                        setState(() => _selectedNationality = value);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('WNA'),
                      value: 'WNA',
                      groupValue: _selectedNationality,
                      onChanged: (value) {
                        setState(() => _selectedNationality = value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Jenis Kelamin'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() => _selectedGender = value);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() => _selectedGender = value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField('Daftar Penyakit', 'Masukkan Daftar Penyakit', _penyakitController),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16), // Menyesuaikan ukuran tombol
                  backgroundColor: Colors.blue, // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Membuat tombol lebih melengkung
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    const Text(
                      'Lanjutkan Isi Data',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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

  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontFamily: 'Arial', fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
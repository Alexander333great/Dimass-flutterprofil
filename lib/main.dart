import 'package:flutter/material.dart';

// ====== DATA MAHASISWA ======
// TODO: sesuaikan data di bawah ini dengan data kamu.
class Mahasiswa {
  final String nama;
  final String nim;
  final String programStudi;
  final String universitas;
  final String hobi;
  final String infoTambahan; 

  const Mahasiswa({
    required this.nama,
    required this.nim,
    required this.programStudi,
    required this.universitas,
    required this.hobi,
    required this.infoTambahan,
  });
}

const Mahasiswa dataSaya = Mahasiswa(
  nama: 'Dimas Ferdiansyah',
  nim: '2495114036',
  programStudi: 'Teknik Informatika', // TODO
  universitas: "Hasyim Asy'ari Jombang", // TODO
  hobi: 'Mancing', // TODO
  infoTambahan:
      'Sedang belajar pemrograman mobile dengan Flutter dan '
      'menyusun antarmuka menggunakan widget bertingkat.',
);

void main() {
  runApp(const ProfilMahasiswaApp());
}

class ProfilMahasiswaApp extends StatelessWidget {
  const ProfilMahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ProfilPage(),
    );
  }
}

// ====== HALAMAN UTAMA ======
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu ditekan')),
            );
          },
        ),
        title: const Text('Profil Mahasiswa'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opsi lainnya')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              // Foto profil
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade300,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/foto.jpg',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    // Jika foto belum ada, tampilkan ikon orang
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Nama mahasiswa
              Text(
                dataSaya.nama,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Kartu identitas: Column berisi beberapa Row
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      BarisInfo(label: 'NIM', nilai: dataSaya.nim),
                      const Divider(),
                      BarisInfo(
                        label: 'Program Studi',
                        nilai: dataSaya.programStudi,
                      ),
                      const Divider(),
                      BarisInfo(
                        label: 'Universitas',
                        nilai: dataSaya.universitas,
                      ),
                      const Divider(),
                      BarisInfo(
                        label: 'Hobi / Deskripsi Singkat',
                        nilai: dataSaya.hobi,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Kartu informasi tambahan: Row (gambar + teks)
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Informasi Tambahan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(dataSaya.infoTambahan),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Detail
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.grey.shade700,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailPage(),
                    ),
                  );
                },
                child: const Text(
                  'Detail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ====== WIDGET BARIS INFO (label : nilai) ======
class BarisInfo extends StatelessWidget {
  final String label;
  final String nilai;

  const BarisInfo({super.key, required this.label, required this.nilai});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(nilai)),
        ],
      ),
    );
  }
}

// ====== HALAMAN DETAIL ======
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text('Detail Mahasiswa'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Nama'),
            subtitle: Text(dataSaya.nama),
          ),
          ListTile(
            leading: const Icon(Icons.badge),
            title: const Text('NIM'),
            subtitle: Text(dataSaya.nim),
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Program Studi'),
            subtitle: Text(dataSaya.programStudi),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Universitas'),
            subtitle: Text(dataSaya.universitas),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Hobi'),
            subtitle: Text(dataSaya.hobi),
          ),
        ],
      ),
    );
  }
}

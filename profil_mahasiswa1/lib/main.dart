import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilMahasiswaPage(),
    );
  }
}

class ProfilMahasiswaPage extends StatelessWidget {
  const ProfilMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Bagian untuk menampilkan Foto Profil
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                // Menggunakan NetworkImage untuk foto dari internet,
                // atau ubah ke AssetImage('assets/foto.png') jika menggunakan gambar lokal.
                backgroundImage: const AssetImage('assets/images/foto.jpeg'),
              ),
            ),
            const SizedBox(height: 16),
            // Nama Mahasiswa
            const Text(
              'Dimas Ferdiansyah',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            // Program Studi / Keterangan
            const Text(
              'Teknik Informatika & Software Engineering',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            // Card Informasi Detail Mahasiswa
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.badge, color: Colors.blue),
                      title: Text('NIM'),
                      subtitle: Text('4122... (Contoh)'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.school, color: Colors.blue),
                      title: Text('Perguruan Tinggi'),
                      subtitle: Text('Universitas Hasyim Asy\'ari'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text('Email'),
                      subtitle: Text('dimasferdiansyah296@gmail.com'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
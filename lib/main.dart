import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> mahasiswa = [
    {
      'nama': 'Ignasius Yoga Puji',
      'nim': 'F1220220057',
      'ipk': '3.9',
      'image': 'images/foto1b.jpg',
      'tgl_lahir': '10 Oktober 2000',
    },
    {
      'nama': 'Dian Restu Adji',
      'nim': 'F1220220056',
      'ipk': '3.99',
      'image': 'images/foto1a.jpeg',
      'tgl_lahir': '25 Desember 1999',
    },
    {
      'nama': 'Mukhammad Shaunan Syahidan Mubarok',
      'nim': 'F1220220070',
      'ipk': '4.3',
      'image': 'images/foto1c.jpg',
      'tgl_lahir': '15 Maret 2001',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi UTS'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: mahasiswa.length,
        itemBuilder: (context, index) {
          final mhs = mahasiswa[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(mhs['image']!),
                radius: 30,
              ),
              title: Text(mhs['nama']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('NIM: ${mhs['nim']}\nIPK: ${mhs['ipk']}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      nama: mhs['nama']!,
                      nim: mhs['nim']!,
                      ipk: mhs['ipk']!,
                      image: mhs['image']!,
                      tgl_lahir: mhs['tgl_lahir']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String nama;
  final String nim;
  final String ipk;
  final String image;
  final String tgl_lahir;

  DetailPage({
    required this.nama,
    required this.nim,
    required this.ipk,
    required this.image,
    required this.tgl_lahir,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Mahasiswa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 50,
              ),
              SizedBox(height: 20),
              Text(nama, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('NIM: $nim', style: TextStyle(fontSize: 18)),
              Text('IPK: $ipk', style: TextStyle(fontSize: 18)),
              Text('Tanggal Lahir: $tgl_lahir', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

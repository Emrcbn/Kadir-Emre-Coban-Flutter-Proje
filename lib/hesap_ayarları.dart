import 'package:flutter/material.dart';
import 'hesabi_sil_sayfasi.dart';
import 'bilgileri_duzenle_sayfasi.dart';
import 'sifreyi_degistir_sayfasi.dart';

class HesapAyarilariSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Ayarları'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(height: 8),
                Text(
                  'İsim',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'Kadir Emre',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Soyisim',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'Çoban',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Doğum Tarihi',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  '11.11.2004',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'E-posta',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  '2206022081@student.beykent.edu.tr',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BilgileriDuzenleSayfasi()),
              );
            },
            icon: Icon(Icons.edit),
            label: Text('Bilgileri Düzenle'),
          ),
          SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SifreyiDegistirSayfasi()),
              );
            },
            icon: Icon(Icons.lock),
            label: Text('Şifreyi Değiştir'),
          ),
          SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HesabiSilSayfasi()),
              );
            },
            icon: Icon(Icons.delete),
            label: Text('Hesabı Sil'),
          ),
        ],
      ),
    );
  }
}


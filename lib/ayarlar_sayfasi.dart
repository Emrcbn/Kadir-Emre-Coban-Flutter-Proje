import 'package:flutter/material.dart';
import 'hesap_ayarları.dart';
import 'veri_yonetimi.dart';
import 'gizlilik_guvenlik.dart';
import 'ana_sayfa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayarlar Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: AyarlarSayfasi(),
    );
  }
}

class AyarlarSayfasi extends StatefulWidget {
  @override
  _AyarlarSayfasiState createState() => _AyarlarSayfasiState();
}

class _AyarlarSayfasiState extends State<AyarlarSayfasi> {
  bool koyuTema = false;
  String selectedLanguage = 'Türkçe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnaSayfa()),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue,
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
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Soyisim',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: Text('Koyu Tema'),
                  onTap: () {
                    setState(() {
                      koyuTema = !koyuTema;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(koyuTema ? 'Koyu tema aktif.' : 'Beyaz tema aktif.')),
                    );
                  },
                  trailing: Switch(
                    value: koyuTema,
                    onChanged: (value) {
                      setState(() {
                        koyuTema = value;
                      });
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Hesap Ayarları'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HesapAyarilariSayfasi()),
                    );
                  },
                ),
                Divider(),
                ExpansionTile(
                  title: Text('Dil ve Bölge Ayarları'),
                  children: [
                    ListTile(
                      title: Text('Türkçe'),
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'Türkçe';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Seçilen dil: $selectedLanguage')));
                      },
                    ),
                    ListTile(
                      title: Text('English'),
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'English';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Seçilen dil: $selectedLanguage')));
                      },
                    ),
                    ListTile(
                      title: Text('Deutsch'),
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'Deutsch';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Seçilen dil: $selectedLanguage')));
                      },
                    ),
                  ],
                ),
                Divider(),
                ListTile(
                  title: Text('Veri Yönetimi'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VeriYonetimiSayfasi()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Gizlilik ve Güvenlik'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GizlilikVeGuvenlikSayfasi()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Uygulama Güncellemeleri'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Mevcut Uygulama Sürümünüz V1.9.11\nOtamatik güncelleme aktif.')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

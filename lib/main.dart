import 'package:flutter/material.dart';
import 'package:untitled1/yaklasan_gorevler_sayfasi.dart';
import 'package:untitled1/istatistikler_ve_analizler_sayfasi.dart';
import 'package:untitled1/yeni_gorev_ekleme_butonu.dart';
import 'ana_sayfa.dart';
import 'ayarlar_sayfasi.dart';
import 'deneme_sayfasi.dart';
import 'giris_ekrani.dart';
import 'arama_sayfasi.dart';
import 'bildirimler_sayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beykent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedIn = false;

  void _login() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn ? MyHomePageContent() : GirisEkrani(onLogin: _login);
  }
}

class MyHomePageContent extends StatefulWidget {
  @override
  _MyHomePageContentState createState() => _MyHomePageContentState();
}

class _MyHomePageContentState extends State<MyHomePageContent> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    AnaSayfa(),
    AyarlarSayfasi(),
    DenemeSayfasi(),
    YaklasanGorevlerSayfasi(),
    YeniGorevEklemeButonu(),
    IstatistiklerVeAnalizlerSayfasi(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('x'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AramaSayfasi()));
            },
          ),

          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BildirimlerSayfasi()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Ana Menü',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Ana Sayfa'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Deneme'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Yaklaşan Görevler'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Yeni Görev Ekle'),
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.leaderboard),
              title: Text('İstatistikler'),
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );

  }
}

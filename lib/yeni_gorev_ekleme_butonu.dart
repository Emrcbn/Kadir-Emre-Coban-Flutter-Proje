import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ana Sayfa'),
        ),
        body: Container(
          color: Colors.blue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                YeniGorevEklemeButonu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class YeniGorevEklemeButonu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => YeniGorevOlusturmaEkrani()),
        );
      },
      child: Text('Yeni Görev Ekle', style: TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class YeniGorevOlusturmaEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yeni Görev Ekle')),
      body: Container(
        color: Colors.blue.shade100,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Görev İsmi'),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Görev Süresi (Örn: 01-05)'),
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(labelText: 'Görev Açıklaması'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _gorevKaydet(context);
              },
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }

  void _gorevKaydet(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Yeni Görev Detayları'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Görev İsmi: ...'),
              Text('Görev Süresi: ...'),
              Text('Görev Açıklaması: ...'),
              Text('Sayaç: ...'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}

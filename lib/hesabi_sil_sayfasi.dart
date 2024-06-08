import 'package:flutter/material.dart';

class HesabiSilSayfasi extends StatefulWidget {
  @override
  _HesabiSilSayfasiState createState() => _HesabiSilSayfasiState();
}

class _HesabiSilSayfasiState extends State<HesabiSilSayfasi> {
  String girilenSifre = '';
  String sifreTekrari = '';
  String girilenKod = '';
  bool benRobotDegilim = false;

  void _showKodDogrulamaPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Doğrulama Kodu'),
          content: TextField(
            decoration: InputDecoration(labelText: 'Doğrulama Kodu'),
            onChanged: (value) {
              girilenKod = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (girilenKod == '5555') {
                  Navigator.of(context).pop();
                  _showUyariPopup(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Yanlış doğrulama kodu!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Onayla'),
            ),
          ],
        );
      },
    );
  }

  void _showUyariPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hesap Silindi'),
          content: Text('Hesabınız Başarılı Bir Şekilde Silinmiştir!\nDeğişikliklerin Uygulanması İçin Lütfen Uygulamadan Çıkınız.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesabı Sil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight + 16.0,
              bottom: 16.0,
            ),
            child: Center(
              child: Text(
                'Hesabı Silme İşlemi',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Şifre'),
              onChanged: (value) {
                girilenSifre = value;
              },
              obscureText: true,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Şifre Tekrarı'),
              onChanged: (value) {
                sifreTekrari = value;
              },
              obscureText: true,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CheckboxListTile(
              title: Text("Ben robot değilim"),
              value: benRobotDegilim,
              onChanged: (newValue) {
                setState(() {
                  benRobotDegilim = newValue!;
                });
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (girilenSifre == '1234' && sifreTekrari == '1234' && benRobotDegilim) {
                  _showKodDogrulamaPopup(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Hata'),
                        content: Text('Girdiğiniz bilgiler yanlış! Lütfen tekrar deneyin.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Tamam'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Hesabı Sil'),
            ),
          ),
        ],
      ),
    );
  }
}

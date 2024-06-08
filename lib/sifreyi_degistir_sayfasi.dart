import 'package:flutter/material.dart';

class SifreyiDegistirSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String mevcutSifre = '';
    String yeniSifre = '';
    String yeniSifreTekrar = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Şifreyi Değiştir'),
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
                'Şifre Değiştirme İşlemi',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Mevcut Şifre'),
                  onChanged: (value) {
                    mevcutSifre = value;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(labelText: 'Yeni Şifre'),
                  onChanged: (value) {
                    yeniSifre = value;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(labelText: 'Yeni Şifre (Tekrar)'),
                  onChanged: (value) {
                    yeniSifreTekrar = value;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (yeniSifre == yeniSifreTekrar) {
                      if (mevcutSifre == '1234') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Şifre Değiştirildi'),
                              content: Text('Şifreniz başarıyla değiştirildi.'),
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
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Hata'),
                              content: Text('Mevcut şifreniz yanlış. Lütfen tekrar deneyin.'),
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
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Hata'),
                            content: Text('Yeni şifreler uyuşmuyor. Lütfen tekrar deneyin.'),
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
                  child: Text('Şifreyi Değiştir'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

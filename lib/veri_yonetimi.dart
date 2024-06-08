import 'package:flutter/material.dart';

class VeriYonetimiSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veri Yönetimi'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Verileri Yedekle'),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('Verileri Geri Yükle'),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('Verileri Paylaş'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}

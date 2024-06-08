import 'package:flutter/material.dart';

class DenemeSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deneme'),
      ),
      body: Center(
        child: Text(
          'Deneme İçeriği',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

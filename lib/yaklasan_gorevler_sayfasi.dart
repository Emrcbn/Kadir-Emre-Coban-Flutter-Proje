import 'dart:math';
import 'package:flutter/material.dart';

class YaklasanGorevlerSayfasi extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yaklaşan Görevler ve Planlar'),
      ),
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Önümüzdeki Görevler ve Planlar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildTaskCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard() {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _randomTaskTitle(),
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            _randomTaskDescription(),
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 8.0),
          Text(
            '${_randomTaskDays()} gün sonra',
            style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  String _randomTaskTitle() {
    List<String> titles = ['Toplantı', 'Rapor Hazırlama', 'E-posta Yanıtlama', 'Alışveriş', 'Spor Yapma', 'Kitap Okuma'];
    return titles[random.nextInt(titles.length)];
  }

  String _randomTaskDescription() {
    List<String> descriptions = ['Önemli toplantıya hazırlanın.', 'Son raporun analizini yapın.', 'Gelen e-postaları yanıtlayın.', 'Market alışverişi yapın.', 'Spor salonuna gidin ve egzersiz yapın.', 'Yeni kitap okumaya başlayın.'];
    return descriptions[random.nextInt(descriptions.length)];
  }

  int _randomTaskDays() {
    return random.nextInt(7) + 1;
  }
}

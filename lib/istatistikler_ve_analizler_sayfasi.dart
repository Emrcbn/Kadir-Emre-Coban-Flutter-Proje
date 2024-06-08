import 'dart:math';
import 'package:flutter/material.dart';

class IstatistiklerVeAnalizlerSayfasi extends StatelessWidget {
  final Random random = Random();

  int _randomTaskCount() {
    return random.nextInt(101);
  }

  double _randomCompletedTaskPercentage() {
    return random.nextDouble() * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'İstatistikler ve Analizler',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatistic(
              title: 'Toplam Görev Sayısı',
              value: _randomTaskCount().toString(),
            ),
            _buildStatistic(
              title: 'Tamamlanan Görevlerin Yüzdesi',
              value: '${_randomCompletedTaskPercentage().toStringAsFixed(2)}%',
            ),
            SizedBox(height: 20.0),
            Text(
              'Görevlerin Kategorilere Göre Dağılımı',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildTaskCategory('İş', random.nextInt(31)),
            _buildTaskCategory('Kişisel', random.nextInt(31)),
            _buildTaskCategory('Alışveriş', random.nextInt(31)),
            _buildTaskCategory('Eğlence', random.nextInt(31)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic({required String title, required String value}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
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
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCategory(String category, int taskCount) {
    return Text(
      '$category: $taskCount',
      style: TextStyle(fontSize: 16.0, fontFamily: 'Roboto', color: Colors.blue),
    );
  }
}

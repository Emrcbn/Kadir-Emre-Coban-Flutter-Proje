import 'package:flutter/material.dart';

class BildirimlerSayfasi extends StatelessWidget {
  final List<String> bildirimler = [
    'Bildirim 1 - 12:00',
    'Bildirim 2 - 13:00',
    'Bildirim 3 - 14:00',
    'Bildirim 4 - 15:00',
    'Bildirim 5 - 16:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirimler Sayfası'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: bildirimler.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bildirimler[index]),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Bildirim'),
                  content: Text(bildirimler[index]),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Kapat'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

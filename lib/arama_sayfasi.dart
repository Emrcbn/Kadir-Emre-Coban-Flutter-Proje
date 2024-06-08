import 'package:flutter/material.dart';

class AramaSayfasi extends StatelessWidget {
  final List<Map<String, String>> kitaplar = [
    {
      "ad": "1984 - George Orwell",
      "aciklama":
      "Distopik bir gelecekte geçen bu klasik roman, totaliter bir rejim altında yaşayan bir adamın hikayesini anlatıyor. Kitap, bireysel özgürlük, sansür ve güç üzerine derinlemesine bir düşünce deneyimi sunuyor."
    },
    {
      "ad": "Yüzüklerin Efendisi - J.R.R. Tolkien",
      "aciklama":
      "Fantastik edebiyatın en önemli eserlerinden biri olan bu üçlemenin ilk kitabı, Frodo Baggins'in Orta Dünya'yı kurtarmak için tehlikeli bir yolculuğa çıkmasını konu alıyor. Kitap, macera, dostluk ve iyilik üzerine epik bir hikaye sunuyor."
    },
    {
      "ad": "Sapiens: İnsan Türünün Kısa Bir Tarihi - Yuval Noah Harari",
      "aciklama":
      "Bu kitap, insanlık tarihini başlangıcından günümüze kadar inceliyor ve insan türünün evrimini, kültürel gelişimini ve dünya üzerindeki etkilerini ele alıyor. İlgi çekici ve düşündürücü bir bakış açısı sunuyor."
    },
    {
      "ad": "Dune - Frank Herbert",
      "aciklama":
      "Bilim kurgu edebiyatının klasiklerinden biri olan bu roman, farklı gezegenler arasında geçen politik entrikalarla dolu bir hikayeyi anlatıyor. Kitap, güç, din ve doğaüstü güçler üzerine derinlemesine düşündürüyor."
    },
    {
      "ad": "Harry Potter ve Felsefe Taşı - J.K. Rowling",
      "aciklama":
      "Fantastik edebiyatın modern klasiklerinden biri olan bu roman, genç bir sihirbaz olan Harry Potter'ın büyülü dünyasına girişini konu alıyor. Kitap, macera, dostluk ve büyü üzerine etkileyici bir hikaye sunuyor."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arama Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Kitap Ara',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Daha Önce Aradıklarınız',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: kitaplar.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      kitaplar[index]["ad"]!,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KitapDetaySayfasi(kitap: kitaplar[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KitapDetaySayfasi extends StatelessWidget {
  final Map<String, String> kitap;

  KitapDetaySayfasi({required this.kitap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kitap["ad"]!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          kitap["aciklama"]!,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue[100],
    );
  }
}

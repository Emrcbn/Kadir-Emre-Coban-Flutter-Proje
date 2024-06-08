import 'package:flutter/material.dart';

class GizlilikVeGuvenlikSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gizlilik ve Güvenlik'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Gizlilik Politikası'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GizlilikPolitikasiSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Kullanıcı Sözleşmesi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KullaniciSozlesmesiSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Uygulama Şifresi Ayarla'),
            onTap: () {
              _showPasswordDialog(context);
            },
          ),
          ListTile(
            title: Text('İki Adımlı Doğrulama'),
            onTap: () {
              _showTwoStepVerificationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Uygulama Şifresi Ayarla"),
          content: TextField(
            decoration: InputDecoration(hintText: "Şifre"),
            keyboardType: TextInputType.number,
            maxLength: 4,
            obscureText: true,
          ),
          actions: [
            FloatingActionButton(
              child: Text("İptal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FloatingActionButton(
              child: Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Şifreniz Başarılı Bir Şekilde Oluşturuldu!"),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  void _showTwoStepVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("İki Adımlı Doğrulama"),
          content: TextField(
            decoration: InputDecoration(hintText: "Telefon Numarası"),
            keyboardType: TextInputType.phone,
            maxLength: 10,
          ),
          actions: [
            FloatingActionButton(
              child: Text("İptal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FloatingActionButton(
              child: Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("İki Adımlı Doğrulama Etkinleştirildi!"),
                ));
              },
            ),
          ],
        );
      },
    );
  }
}

class GizlilikPolitikasiSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gizlilik Politikası'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Gizlilik Politikası',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Son güncellenme: 27/05/2024',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Güvenliğiniz bizim için önemli. Bu sebeple bizimle paylaşacağınız kişisel verileriz hassasiyetle korunmaktadır.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Toplanan Kişisel Verileriniz, Toplanma Yöntemi ve Hukuki Sebebi',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'IP adresiniz ve kullanıcı aracısı bilgileriniz, sadece analiz yapmak amacıyla ve çerezler (cookies) vb. teknolojiler vasıtasıyla, otomatik veya otomatik olmayan yöntemlerle ve bazen de analitik sağlayıcılar, reklam ağları, arama bilgi sağlayıcıları, teknoloji sağlayıcıları gibi üçüncü taraflardan elde edilerek, işlenecektir.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Toplanan Kişisel Verilerin Kimlere ve Hangi Amaçlarla Aktarılabileceği',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Bizimle paylaştığınız kişisel verileriniz, hizmetlerimizi yerine getirebilmek ve yasal gereklilikler doğrultusunda aktarılabilir.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Kişisel Verileri İşlenen Kişi Olarak Haklarınız',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'KVKK madde 11 uyarınca herkes, veri sorumlusuna başvurarak haklarını kullanabilir.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class KullaniciSozlesmesiSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Sözleşmesi'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Kullanıcı Sözleşmesi',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Madde 1: Taraflar',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Bu Sözleşme, Şirket ve Kullanıcı arasında düzenlenmiştir.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Madde 2: Sözleşmenin Konusu',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Bu Sözleşme, uygulamanın kullanım koşullarını belirler.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Madde 3: Kullanıcının Hak ve Yükümlülükleri',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Kullanıcı, uygulamayı kişisel ve yasal amaçlarla kullanır.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Madde 4: Şirketin Hak ve Yükümlülükleri',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Şirket, uygulamayı doğru ve güvenilir bir şekilde sunar.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Madde 5: Sorumlulukların Sınırlandırılması',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Şirket, uygulamanın kullanımından kaynaklanan zararlardan sorumlu değildir.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

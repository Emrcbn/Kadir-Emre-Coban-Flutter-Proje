import 'package:flutter/material.dart';
import 'kayit_ekrani.dart';
import 'sifresifirla_ekrani.dart';

class GirisEkrani extends StatefulWidget {
  final VoidCallback onLogin;

  GirisEkrani({required this.onLogin});

  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    widget.onLogin();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hoş Geldiniz'),
          content: Text('Hoş geldiniz, Emre Bey'),
          actions: [
            TextButton(
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

  void _showSocialLoginDialog(String platform) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$platform ile Giriş Yap'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Giriş Yap'),
            ),
          ],
        );
      },
    );
  }

  void _sifreSifirla() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SifreSifirlaEkrani()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Ekranı'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Center(
                child: Image.asset(
                  'assets/images/hosgeldiniz.jpg',
                  width: 400,
                  height: 100,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            _buildLoginForm(),
            SizedBox(height: 20.0),
            _buildSocialLoginButtons(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KayitEkrani()),
                );
              },
              child: Text('Hesap Oluştur'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: _sifreSifirla,
              child: Text('Şifremi Unuttum'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Şifre',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {},
            ),
          ),
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {

            _login();
          },
          child: Text('Giriş Yap'),

          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15.0),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSocialLoginButton('Google', 'assets/images/signgoogle.jpg'),
          _buildSocialLoginButton('iOS', 'assets/images/signapple.jpg'),
          _buildSocialLoginButton('Facebook', 'assets/images/signfacebook.jpg'),
        ],
      ),
    );
  }


  Widget _buildSocialLoginButton(String platform, String assetPath) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _showSocialLoginDialog(platform);
        },
        child: Image.asset(
          assetPath,
          width: 100,
          height: 50,
        ),
      ),
    );
  }
}

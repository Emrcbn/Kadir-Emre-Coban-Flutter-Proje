import 'dart:async';
import 'package:flutter/material.dart';

class SifreSifirlaEkrani extends StatefulWidget {
  @override
  _SifreSifirlaEkraniState createState() => _SifreSifirlaEkraniState();
}

class _SifreSifirlaEkraniState extends State<SifreSifirlaEkrani> {
  late Timer _timer;
  int _start = 60;
  String _verificationCode = '';
  bool _isCodeCorrect = false;
  bool _isEmailSent = false;
  String _email = '';
  String _password = '';
  String _newPassword = '';
  String _confirmNewPassword = '';
  String _errorText = '';
  String _oldPassword = 'Beykent';

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _submitVerificationCode() {
    if (_verificationCode == '1234') {
      setState(() {
        _isCodeCorrect = true;
      });
    } else {
      setState(() {
        _errorText = 'Girilen kod yanlış!';
      });
    }
  }

  void _resendEmail() {
    setState(() {
      _isEmailSent = true;
      _start = 60;
      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Sıfırla'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            !_isEmailSent
                ? TextField(
              decoration: InputDecoration(labelText: 'E-posta'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            )
                : SizedBox(),
            !_isEmailSent
                ? ElevatedButton(
              onPressed: () {
                if (_email.contains('@')) {
                  _resendEmail();
                } else {
                  setState(() {
                    _errorText = 'Geçerli bir e-posta adresi giriniz!';
                  });
                }
              },
              child: Text('E-posta Gönder'),
            )
                : SizedBox(),
            SizedBox(height: 20),
            _isEmailSent
                ? Column(
              children: [
                Text(
                  'E-posta adresinize doğrulama kodu gönderildi.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(labelText: 'Doğrulama Kodu'),
                  onChanged: (value) {
                    setState(() {
                      _verificationCode = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _submitVerificationCode();
                  },
                  child: Text('Doğrula'),
                ),
                SizedBox(height: 20),
                _errorText.isNotEmpty ? Text(_errorText, style: TextStyle(color: Colors.red)) : SizedBox(),
              ],
            )
                : SizedBox(),
            SizedBox(height: 20),
            _isCodeCorrect
                ? Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Yeni Şifre'),
                  onChanged: (value) {
                    setState(() {
                      _newPassword = value;
                    });
                  },
                  obscureText: true,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Yeni Şifre Tekrar'),
                  onChanged: (value) {
                    setState(() {
                      _confirmNewPassword = value;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_newPassword.length < 8 ||
                        !_newPassword.contains(new RegExp(r'[A-Z]')) ||
                        !_newPassword.contains(new RegExp(r'[a-z]')) ||
                        !_newPassword.contains(new RegExp(r'[0-9]')) ||
                        !_newPassword.contains('.')) {
                      setState(() {
                        _errorText =
                        'Yeni şifre en az 8 karakterden oluşmalı, büyük ve küçük harfleri içermeli, özel karakter olarak sadece nokta içerebilir.';
                      });
                    } else if (_newPassword != _confirmNewPassword) {
                      setState(() {
                        _errorText = 'Yeni şifreler uyuşmuyor!';
                      });
                    } else {
                      setState(() {
                        _errorText = 'Şifreniz başarıyla sıfırlandı.';
                      });
                    }
                  },
                  child: Text('Şifreyi Sıfırla'),
                ),
                SizedBox(height: 20),
                _errorText.isNotEmpty ? Text(_errorText, style: TextStyle(color: Colors.red)) : SizedBox(),
              ],
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class KayitEkrani extends StatefulWidget {
  @override
  _KayitEkraniState createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  bool _isNotRobot = false;
  bool _isFormValid = true;

  void _submitForm() {
    setState(() {
      _isFormValid = true;
      if (_emailController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          _phoneController.text.isEmpty ||
          _birthDateController.text.isEmpty ||
          !_isNotRobot) {
        _isFormValid = false;
        return;
      }
      print('Email: ${_emailController.text}');
      print('Şifre: ${_passwordController.text}');
      print('Telefon: ${_phoneController.text}');
      print('Doğum Tarihi: ${_birthDateController.text}');
      print('Robot Değilim: $_isNotRobot');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Hesabınız başarıyla oluşturuldu!'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Oluştur'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                errorText: _isFormValid || _emailController.text.isNotEmpty
                    ? null
                    : 'Lütfen bu alanı doldurun',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
                errorText: _isFormValid || _passwordController.text.isNotEmpty
                    ? null
                    : 'Lütfen bu alanı doldurun',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'Telefon Numarası',
                border: OutlineInputBorder(),
                errorText: _isFormValid || _phoneController.text.isNotEmpty
                    ? null
                    : 'Lütfen bu alanı doldurun',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _birthDateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Doğum Tarihi (GG.AA.YYYY)',
                border: OutlineInputBorder(),
                errorText: _isFormValid || _birthDateController.text.isNotEmpty
                    ? null
                    : 'Lütfen bu alanı doldurun',
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Checkbox(
                  value: _isNotRobot,
                  onChanged: (bool? value) {
                    setState(() {
                      _isNotRobot = value ?? false;
                    });
                  },
                ),
                Text('Ben robot değilim'),
              ],
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Hesap Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}

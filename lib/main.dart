import 'package:flutter/material.dart';
import 'kalkulator.dart';
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginForm(),
        '/home': (context) => HomeScreen(),
        '/kalkulator': (context) => BMICalculator(),
        '/profil': (context) => ProfilPage(), // Tambahkan rute untuk profil
      },
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == '1234') {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  _showPasswordErrorDialog();
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _showPasswordErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Password salah. Silakan coba lagi.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Halaman Utama dengan Bottom Navigation'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          // Tambahkan logika navigasi berdasarkan indeks
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/kalkulator');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/profil');
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke layar kalkulator BMI
          Navigator.pushReplacementNamed(context, '/kalkulator');
        },
        child: Icon(Icons.calculate),
      ),
    );
  }
}

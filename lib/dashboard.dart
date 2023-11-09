import 'package:flutter/material.dart';
import 'kalkulator.dart';
import 'profil.dart'; // Pastikan untuk mengimport file profil.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
          '/kalkulator', // Ganti '/kalkulator' atau '/profil' sesuai dengan halaman yang diinginkan
      routes: {
        '/': (context) => HomeScreen(),
        '/kalkulator': (context) => BMICalculator(),
        '/profil': (context) => Profile(),
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
        child: Text('Selamat Datang'),
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
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMICalculator()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Pindah ke layar kalkulator BMI ketika tombol floating action button ditekan
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BMICalculator()),
          );
        },
        child: Icon(Icons.calculate),
      ),
    );
  }
}

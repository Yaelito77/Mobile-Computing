import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(VCardApp());

class VCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V-Card',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: VCardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Tarjeta Digital'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFE0F7FA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Yael Maldonado Diaz',
                    style: GoogleFonts.lato(
                      fontSize: 28,
                      color: const Color(0xFF263238),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Yaelemail777@ejemplo.com',
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '+1 (787) 556 - 5656',
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/qrcode.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Usuario de Github: Yaelito77',
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

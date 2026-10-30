import 'package:flutter/material.dart';
import 'package:raion_project/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'DompetKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0288D1)),
        // Latar halaman abu-abu muda supaya kartu putih terlihat menonjol.
        scaffoldBackgroundColor: const Color(0xFFF4F6FB),
      ),

      home: const HomePage(),
    );
  }
}



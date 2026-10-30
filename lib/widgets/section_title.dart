import 'package:flutter/material.dart';
class SectionTitle extends StatelessWidget {
  final String teks;
 
  const SectionTitle(this.teks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 14),
      child: Text(
        teks,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A1C1E),
        ),
      ),
    );
  }
  }
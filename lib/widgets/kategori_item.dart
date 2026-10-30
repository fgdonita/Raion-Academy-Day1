import 'package:flutter/material.dart';
import 'package:raion_project/models/kategori.dart';

class KategoriItem extends StatelessWidget {
  final Kategori kategori;

  const KategoriItem({super.key, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
             
              borderRadius: BorderRadius.circular(20), // sudut tumpul
              border: Border.all(
                
                width: 1.5,
              ),
            ),
            child: Icon(kategori.ikon, size: 36, color: kategori.warna),
          ),
          const SizedBox(height: 8),
          Text(
            kategori.nama,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:raion_project/models/transaksi.dart';
import 'package:raion_project/utils/format_rupiah.dart';

class RiwayatCard extends StatelessWidget {
  final Transaksi transaksi;

  const RiwayatCard({super.key, required this.transaksi});

  @override
  Widget build(BuildContext context) {
    final kategori = transaksi.kategori;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
             
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(kategori.ikon, color: kategori.warna),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kategori.nama,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Pengeluaran',
                  style: TextStyle(fontSize: 12, color: Color(0xFF5F6368)),
                ),
              ],
            ),
          ),
          Text(
            '- ${formatRupiah(transaksi.jumlah)}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC62828), // merah = uang keluar
            ),
          ),
        ],
      ),
    );
  }
}
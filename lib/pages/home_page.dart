import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raion_project/models/transaksi.dart';
import 'package:raion_project/providers/keuangan_provider.dart';
import 'package:raion_project/data/data_dummy.dart';
import 'package:raion_project/widgets/kategori_item.dart';
import 'package:raion_project/widgets/riwayat_card.dart';
import 'package:raion_project/widgets/saldo_card.dart';
import 'package:raion_project/widgets/section_title.dart';
import 'package:raion_project/pages/laporan_page.dart';
import 'package:raion_project/widgets/tambah_transaksi_dialog.dart';
import 'package:raion_project/widgets/app_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riwayat = ref.watch(keuanganProvider);
    final saldo = ref.watch(saldoProvider);

    return Scaffold(
      appBar: const DompetKuAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFB3E5FC),
                    backgroundImage: AssetImage('assets/AvatarPhoto.jpeg'),
                  ),
                  SizedBox(width: 12),
                   Expanded(
                    child: Text(
                      'Halo, Donita!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1C1E),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              SaldoCard(
                saldo: saldo,
                onLaporanPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LaporanPage(),
                  ),
                );
                },
              ),

              const SectionTitle('Kategori'),
              Row(
                children: daftarKategori
                  .map((k) => KategoriItem(kategori: k))
                  .toList(),
              ),

              const SectionTitle('Riwayat'),
              ...riwayat.map((t) => RiwayatCard(transaksi: t)),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0288D1),
        foregroundColor: Colors.white,
        onPressed: () async {
          final hasil = await showDialog<Transaksi>(
            context: context,
            builder: (context) => const TambahTransaksiDialog(),
          );
          if (hasil != null) {
            ref.read(keuanganProvider.notifier).tambah(hasil);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
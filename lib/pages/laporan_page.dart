import 'package:flutter/material.dart';
import 'package:raion_project/utils/format_rupiah.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raion_project/providers/keuangan_provider.dart';
import 'package:raion_project/widgets/app_bar.dart';

class LaporanPage extends ConsumerWidget {
  const LaporanPage({super.key});
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final perKategori = ref.watch(totalPerKategoriProvider);
      final totalPengeluaran = ref.watch(totalPengeluaranProvider);
    return Scaffold(
      // AppBar otomatis menampilkan panah kembali (←) yang juga memanggil pop.
      appBar: const DompetKuAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Laporan Keuangan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Kartu total pengeluaran
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFFC62828),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Total Pengeluaran',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      formatRupiah(totalPengeluaran),
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Rincian per Kategori',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
 
              // Daftar rincian: nama, jumlah, dan batang persentase
              Expanded(
                child: ListView(
                  children: perKategori.entries.map((e) {
                    final kategori = e.key;
                    final total = e.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        children: [
                          Icon(kategori.ikon, color: kategori.warna),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              kategori.nama,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      
                              Text(
                                formatRupiah(total),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                    );
                  }).toList(),
                ),
              ),
 
              // ===== PERUBAHAN 13 (POP): tombol kembali ke halaman sebelumnya =====
              // pop = membuang halaman paling atas, sehingga halaman utama terlihat lagi.
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text(
                    'Kembali',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0288D1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
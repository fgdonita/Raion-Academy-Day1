import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ===== PERUBAHAN 1 (BARU): model data sederhana =====
// Satu "cetakan" untuk kategori: punya nama, ikon (gambar), dan warna.
class Kategori {
  final String nama;
  final IconData ikon;
  final Color warna;

  const Kategori(this.nama, this.ikon, this.warna);
}

// Satu "cetakan" untuk transaksi di Riwayat.
class Transaksi {
  final Kategori kategori;
  final int jumlah;

  const Transaksi(this.kategori, this.jumlah);
}

// ===== PERUBAHAN 2 (BARU): data kategori & riwayat =====
const kMakanan = Kategori('Makanan', Icons.restaurant, Color(0xFFE65100));
const kTransportasi =
    Kategori('Transportasi', Icons.directions_bus, Color(0xFF1565C0));
const kPendidikan = Kategori('Pendidikan', Icons.school, Color(0xFF6A1B9A));
const kKesehatan =
    Kategori('Kesehatan', Icons.medical_services, Color(0xFFC62828));

const daftarKategori = [kMakanan, kTransportasi, kPendidikan, kKesehatan];

const daftarRiwayat = [
  Transaksi(kMakanan, 45000),
  Transaksi(kTransportasi, 20000),
  Transaksi(kPendidikan, 350000),
];

// ===== PERUBAHAN 3 (BARU): fungsi pengubah angka menjadi format Rupiah =====
// Contoh: 2500000 -> "Rp 2.500.000"
String formatRupiah(int nominal) {
  final teks = nominal.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
      );
  return 'Rp $teks';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ===== PERUBAHAN 4: judul, hilangkan banner DEBUG, warna tema biru =====
      title: 'Aplikasi Keuangan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0288D1)),
        // Latar halaman abu-abu muda supaya kartu putih terlihat menonjol.
        scaffoldBackgroundColor: const Color(0xFFF4F6FB),
      ),


      // ===== PERUBAHAN 5: parameter title dihapus (tidak dipakai lagi) =====
      home: const MyHomePage(),
    );
  }
}

// ===== PERUBAHAN 6: StatefulWidget -> StatelessWidget =====
// Counter dihapus, jadi halaman ini tidak lagi menyimpan data yang berubah.
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ===== PERUBAHAN 7 (BARU): widget pembantu untuk judul bagian =====
  Widget _buildJudul(String teks) {
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

  // ===== PERUBAHAN 8 (BARU): satu kotak kategori (ikon + nama) =====
  Widget _buildKategori(Kategori kategori) {
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

  // ===== PERUBAHAN 9 (BARU): satu baris riwayat transaksi =====
  Widget _buildRiwayat(Transaksi transaksi) {
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

  @override
  Widget build(BuildContext context) {
    // ===== PERUBAHAN 10: Scaffold dibuat ulang sesuai gambar =====
    // AppBar dan FloatingActionButton dihapus karena tidak ada di gambar.
    // SafeArea: agar isi tidak tertutup status bar.
    // SingleChildScrollView: agar halaman bisa di-scroll.
    return Scaffold(
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
              // --- BAGIAN B: kartu biru Saldo ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF0288D1),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0288D1).withValues(alpha: 0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.payments, size:40),
                    const Text(
                      'Saldo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Nominal saldo dibuat BESAR dan tebal.
                    Text(
                      formatRupiah(2500000),
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push (
                            context,
                            MaterialPageRoute (
                              builder: (context) => const LaporanPage() 
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF01579B),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Laporan Keuangan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // --- BAGIAN C: Kategori (4 kotak sejajar) ---
              _buildJudul('Kategori'),
              Row(
                // map(): mengubah tiap data kategori menjadi satu kotak.
                children: daftarKategori.map(_buildKategori).toList(),
              ),

              // --- BAGIAN D: Riwayat (3 baris) ---
              _buildJudul('Riwayat'),
              ...daftarRiwayat.map(_buildRiwayat),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== PERUBAHAN 12 (BARU): halaman kedua "Laporan Keuangan" =====
class LaporanPage extends StatelessWidget {
  const LaporanPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    // Menjumlahkan semua pengeluaran di daftarRiwayat.
    final totalPengeluaran =
        daftarRiwayat.fold<int>(0, (total, item) => total + item.jumlah);
 
    return Scaffold(
      // AppBar otomatis menampilkan panah kembali (←) yang juga memanggil pop.
      appBar: AppBar(
        title: const Text('Laporan Keuangan'),
        backgroundColor: const Color(0xFF0288D1),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  children: daftarRiwayat.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(item.kategori.ikon,
                                  color: item.kategori.warna),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item.kategori.nama,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                formatRupiah(item.jumlah),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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

import 'package:raion_project/models/kategori.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raion_project/data/data_dummy.dart';
import 'package:raion_project/models/transaksi.dart';


const saldoAwal = 2500000;
class KeuanganNotifier extends Notifier<List<Transaksi>> {
  @override
  List<Transaksi> build() => [...daftarRiwayat];

  void tambah(Transaksi transaksi) {
    state = [transaksi, ...state];
  }
}

final keuanganProvider = 
  NotifierProvider<KeuanganNotifier, List<Transaksi>>(KeuanganNotifier.new);
final totalPengeluaranProvider = Provider<int>((ref) {
  final daftar = ref.watch(keuanganProvider);
  return daftar.fold<int>(0, (total, item) => total + item.jumlah);
});

final saldoProvider = Provider<int>((ref) {
  return saldoAwal - ref.watch(totalPengeluaranProvider);
});

final totalPerKategoriProvider = Provider<Map<Kategori, int>>((ref) {
  final daftar = ref.watch(keuanganProvider);
  final hasil = <Kategori, int>{};

  for(final k in daftarKategori) {
    final total = daftar
    .where((t) => t.kategori.nama == k.nama)
    .fold<int>(0, (jumlah, t) => jumlah + t.jumlah);

    if (total > 0) hasil[k] = total;
  }
  return hasil;
});

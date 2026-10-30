String formatRupiah(int nominal) {
  final teks = nominal.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
      );
  return 'Rp $teks';
}
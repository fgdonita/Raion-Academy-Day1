import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raion_project/data/data_dummy.dart';
import 'package:raion_project/models/kategori.dart';
import 'package:raion_project/models/transaksi.dart';

class TambahTransaksiDialog extends StatefulWidget {
  const TambahTransaksiDialog({super.key});

  @override
  State<TambahTransaksiDialog> createState() => _TambahTransaksiDialogState();
}

class _TambahTransaksiDialogState extends State<TambahTransaksiDialog> {
  Kategori _dipilih = daftarKategori.first;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('Tambah Pengeluaran'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<Kategori>(
            initialValue: _dipilih,
            decoration: InputDecoration(
              labelText: 'Kategori',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            items: daftarKategori
                .map((k) => DropdownMenuItem(value: k, child: Text(k.nama)))
                .toList(),
            onChanged: (k) {
              if (k != null) setState(() => _dipilih = k);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: 'Jumlah (Rp)',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            final jumlah = int.tryParse(_controller.text);
            if (jumlah == null || jumlah <= 0) return;
            Navigator.pop(context, Transaksi(_dipilih, jumlah));
          },
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}
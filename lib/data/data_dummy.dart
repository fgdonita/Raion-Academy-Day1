import 'package:flutter/material.dart';
import 'package:raion_project/models/kategori.dart';
import 'package:raion_project/models/transaksi.dart';

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
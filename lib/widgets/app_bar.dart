import 'package:flutter/material.dart';

class DompetKuAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DompetKuAppBar({super.key});
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'DompetKu',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xFF0288D1),
      foregroundColor: Colors.white,
    );
  }

}
import 'package:flutter/material.dart';

TextEditingController tanggalDaftarController = TextEditingController();

class tanggalDaftar extends StatefulWidget {
  const tanggalDaftar({super.key});

  @override
  State<tanggalDaftar> createState() => _tanggalDaftarState();
}

// ignore: camel_case_types
class _tanggalDaftarState extends State<tanggalDaftar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tanggalDaftarController,
      decoration: InputDecoration(
        label: const Text("Tanggal Daftar"),
        suffixIcon: IconButton(
          onPressed: () {
            pilihTanggal();
          },
          icon: const Icon(Icons.date_range),
        ),
      ),
    );
  }

  Future<void> pilihTanggal() async {
    DateTime? tglDidapat;

    tglDidapat = await showDatePicker(
      context: context,
       firstDate: DateTime(2024),
        lastDate: DateTime(2025),
        );

        if (tglDidapat.toString() != "null") {
          tanggalDaftarController.text = tglDidapat .toString().substring(0, 10);
        }
  }
}
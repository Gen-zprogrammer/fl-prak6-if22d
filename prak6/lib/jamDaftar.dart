import 'package:flutter/material.dart';

TextEditingController jamDaftarController = TextEditingController();

class JamDaftar extends StatefulWidget {
  const JamDaftar({super.key});

  @override
  State<JamDaftar> createState() => _JamDaftarState();
}

class _JamDaftarState extends State<JamDaftar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: jamDaftarController,
      decoration: InputDecoration(
        label: Text("Jam Daftar"),
        suffixIcon: IconButton(
          onPressed: () {
            pilihTanggal();
          },
          icon: Icon(Icons.timer),
          ),
      ),
    );
  }

  Future<void> pilihTanggal() async {
    TimeOfDay? tglDidapat;

    tglDidapat = 
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (tglDidapat.toString() != "null") {
      jamDaftarController.text = tglDidapat
      .toString()
      .replaceAll('TimeOfDay(', '')
      .replaceAll(')', '');
 
    }
  }
}
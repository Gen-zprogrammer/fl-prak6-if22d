import 'package:flutter/material.dart';
import 'package:prak6/model.dart';

class DataPendaftaran extends StatefulWidget {
  const DataPendaftaran({super.key});

  @override
  State<DataPendaftaran> createState() => _DataPendaftaranState();
}

class _DataPendaftaranState extends State<DataPendaftaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Pendaftaran"),
      ),
      body: ListView.builder(
        itemCount: pendaftaranList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(pendaftaranList[index].nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pendaftaranList[index].email),
                Text(pendaftaranList[index].noTelp),
                Text(pendaftaranList[index].jenisKelamin),
                Text(pendaftaranList[index].bahasa),
                Text(pendaftaranList[index].agama),
                Text(pendaftaranList[index].tanggalDaftar),
                Text(pendaftaranList[index].jamDaftar),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                hapusData(index);
              },
              icon: Icon(
                Icons.delete,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void hapusData(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Hapus Data"),
        content: Text(
            "Apakah Anda yakin akan hapus data ${pendaftaranList[index].nama} ?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                pendaftaranList.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text("Ya"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Tidak"),
          ),
        ],
      ),
    );
  }
}

import 'package:database_app1/database_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormPage extends StatefulWidget {
  String nim = "";
  String nama = "";
  String judul = "";

  FormPage({Key? key, this.nim = "", this.nama = "", this.judul = ""});
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String nim = "";
  String nama = "";
  String judul = "";
  var txtNim = TextEditingController();
  var txtNama = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtNim.text = widget.nim;
    txtNama.text = widget.nama;
    nim = widget.nim;
    nama = widget.nama;
    judul = widget.judul;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
        actions: [
          PopupMenuButton(
            onSelected: popupMenuClick,
            itemBuilder: (BuildContext context) {
              return {
                'Hapus',
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtNim,
              decoration: InputDecoration(
                  labelText: "NIM",
                  border: OutlineInputBorder(),
                  hintText: "Masukkan NIM"),
              onChanged: (value) {
                setState(() {
                  nim = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtNama,
              decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Nama"),
              onChanged: (value) {
                setState(() {
                  nama = value;
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                DatabaseServices.createUpdateMahasiswa(context, nim, nama);
              },
              child: Text("Simpan"))
        ],
      ),
    );
  }

  void popupMenuClick(String value) {
    switch (value) {
      case 'Hapus':
        DatabaseServices.deleteMahasiswa(widget.nim);
        Navigator.pop(context);
        break;
      case 'Menu2':
// code saat menu 2 dipilih
        break;
    }
  }
}

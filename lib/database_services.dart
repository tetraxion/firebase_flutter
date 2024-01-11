import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseServices {
  static Future<void> createUpdateMahasiswa(
      BuildContext context, String NIM, String nama) async {
    DocumentReference mahasiswaReference =
        FirebaseFirestore.instance.collection("mahasiswa").doc(NIM);
    Map<String, dynamic> dataMahasiswa = {"NIM": NIM, "nama": nama};

    mahasiswaReference.set(dataMahasiswa).whenComplete(() {
      Navigator.pop(context);
    });
  }

  static Future<void> deleteMahasiswa(String nim) async {
    CollectionReference mahasiswaCollection =
        FirebaseFirestore.instance.collection('mahasiswa');
    return await mahasiswaCollection.doc(nim).delete();
  }
}

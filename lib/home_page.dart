import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database_app1/form_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormPage(judul: "Tambah Data");
          }));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('mahasiswa')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          print("${documentSnapshot["nama"]}");
                          return InkWell(
                            child: ListTile(
                              leading: Icon(
                                Icons.person,
                                size: 60,
                              ),
                              title: Text(documentSnapshot["nama"]),
                              subtitle: Text(documentSnapshot["NIM"]),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FormPage(
                                  judul: "Ubah Data",
                                  nim: documentSnapshot["NIM"],
                                  nama: documentSnapshot["nama"],
                                );
                              }));
                            },
                          );
                        });
                  } else {
                    return Text("Tidak ada data");
                  }
                })
          ],
        ),
      ),
    );
  }
}

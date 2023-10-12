// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class edit extends StatefulWidget {
//
//   @override
//   State<edit> createState() => _editState();
// }
//
// class _editState extends State<edit> {
//   final editKodeBuku = TextEditingController();
//   final editJudulBuku = TextEditingController();
//   final editTahunTerbit = TextEditingController();
//   final editNamaPenerbit = TextEditingController();
//   final editNamaPengarang = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection('users');
//     return Scaffold(
//       appBar: AppBar(title: Text('Edit Atribut Buku'), centerTitle: true,),
//       body: Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: StreamBuilder(
//             stream: users.snapshots(),
//             builder: (_, snapshot) {
//               if (snapshot.hasData) {
//                 var data = snapshot.data!.docs[0];
//                 // kodeBuku.text = data['kodeBuku'];
//                 return Container(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: editKodeBuku,
//                         decoration: InputDecoration(
//                           labelText: "Kode Buku",
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       TextFormField(
//                         controller: editJudulBuku,
//                         decoration: InputDecoration(
//                           labelText: "Judul Buku",
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       TextFormField(
//                         controller: editTahunTerbit,
//                         decoration: InputDecoration(
//                           labelText: "Tahun Terbit",
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       TextFormField(
//                         controller: editNamaPenerbit,
//                         decoration: InputDecoration(
//                           labelText: "Nama Penerbit",
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       TextFormField(
//                         controller: editNamaPengarang,
//                         decoration: InputDecoration(
//                           labelText: "Nama Pengarang",
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       TextButton(
//                           onPressed: () {
//                             final docUser = FirebaseFirestore.instance
//                                 .collection('users')
//                                 .doc();
//                             docUser.update({
//                               'editKodeBuku': editKodeBuku.text,
//                               'editJudulBuku': editJudulBuku.text,
//                               'editTahunTerbit': editTahunTerbit.text,
//                               'editNamaPenerbit': editNamaPenerbit.text,
//                               'editNamaPengarang': editNamaPengarang.text,
//                             });
//                           },
//                           child: Text('Save Data')),
//                     ],
//                   ),
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

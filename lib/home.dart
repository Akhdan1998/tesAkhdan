part of 'pages.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final kodeBuku = TextEditingController();
  final judulBuku = TextEditingController();
  final tahunTerbit = TextEditingController();
  final namaPenerbit = TextEditingController();
  final namaPengarang = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Akhdan Tes'),
        leading: Container(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: users.orderBy('tahunTerbit', descending: true).snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!.docs[0];
                kodeBuku.text = data['kodeBuku'];
                judulBuku.text = data['judulBuku'];
                tahunTerbit.text = data['tahunTerbit'].toString();
                namaPenerbit.text = data['namaPenerbit'];
                namaPengarang.text = data['namaPengarang'];
                return Column(
                  children: snapshot.data!.docs
                      .map(
                        (e) =>
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Kode Buku'),
                                    Text(
                                      e.get('kodeBuku'),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Judul Buku'),
                                    Text(
                                      e.get('judulBuku'),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Tahun Terbit'),
                                    Text(
                                      e.get('tahunTerbit').toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Nama Penerbit'),
                                    Text(
                                      e.get('namaPenerbit'),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Nama Pengarang'),
                                    Text(
                                      e.get('namaPengarang'),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet<void>(
                                          isDismissible: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50),
                                                topRight: Radius.circular(50)),
                                          ),
                                          backgroundColor: Colors.white,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    right: 20,
                                                    top: 20,
                                                    left: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                        'Edit Atribut Buku'),
                                                    TextFormField(
                                                      controller: kodeBuku,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: "Kode Buku",
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    TextFormField(
                                                      controller: judulBuku,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: "Judul Buku",
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    TextFormField(
                                                      controller: tahunTerbit,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        "Tahun Terbit",
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    TextFormField(
                                                      controller: namaPenerbit,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        "Nama Penerbit",
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    TextFormField(
                                                      controller: namaPengarang,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        "Nama Pengarang",
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    TextButton(
                                                      onPressed: () {
                                                        // Mendapatkan ID dokumen
                                                        String documentId = e
                                                            .id;

                                                        // Mengupdate seluruh data di Firestore berdasarkan ID
                                                        users.doc(documentId)
                                                            .update({
                                                          'kodeBuku': kodeBuku
                                                              .text,
                                                          'judulBuku': judulBuku
                                                              .text,
                                                          'tahunTerbit': tahunTerbit
                                                              .text,
                                                          'namaPenerbit': namaPenerbit
                                                              .text,
                                                          'namaPengarang': namaPengarang
                                                              .text,
                                                        });

                                                        kodeBuku.text = '';
                                                        judulBuku.text = '';
                                                        tahunTerbit.text = '';
                                                        namaPenerbit.text = '';
                                                        namaPengarang.text = '';

                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                          'Update Atribut Buku'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        // Get.to(edit());
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: Colors.red,
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child: Text('Update'),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        users.doc(e.id).delete();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: Colors.green,
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child: Text('Delete'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                  )
                      .toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(create());
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

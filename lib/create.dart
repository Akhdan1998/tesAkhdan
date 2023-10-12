part of 'pages.dart';

class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
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
        title: Text('Buat Atribut Buku'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: kodeBuku,
                decoration: InputDecoration(
                  labelText: "Kode Buku",
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: judulBuku,
                decoration: InputDecoration(
                  labelText: "Judul Buku",
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: tahunTerbit,
                decoration: InputDecoration(
                  labelText: "Tahun Terbit",
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: namaPenerbit,
                decoration: InputDecoration(
                  labelText: "Nama Penerbit",
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: namaPengarang,
                decoration: InputDecoration(
                  labelText: "Nama Pengarang",
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // color: Colors.grey,
        padding: EdgeInsets.all(15),
        child: GestureDetector(
          onTap: () {
            users.add({
              'kodeBuku': kodeBuku.text,
              'judulBuku': judulBuku.text,
              'tahunTerbit': int.tryParse(tahunTerbit.text) ?? 0,
              'namaPenerbit': namaPenerbit.text,
              'namaPengarang': namaPengarang.text,
            });
            kodeBuku.text = '';
            judulBuku.text = '';
            tahunTerbit.text = '';
            namaPenerbit.text = '';
            namaPengarang.text = '';
            Get.to(MyHomePage());
          },
          child: Container(
            height: 40,
            alignment: Alignment.center,
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
                ]),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text('Create Atribut'),
          ),
        ),
      ),
    );
  }
}

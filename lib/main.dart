import 'package:flutter/material.dart';
import 'produk.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController hargaCtrl = TextEditingController();
  List<Produk> listProduk= [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Toko Komputer",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Column(
            children: [
              // Membatasi tinggi ListView.builder menjadi setengah layar
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5, // Setengah layar
                child: ProdukList(),
              ),
              SizedBox(height: 10), // Jarak antara ListView dan tombol
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Reset", style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int harga = int.tryParse(hargaCtrl.text) ?? 0;
                        listProduk.add(Produk(
                          nama: namaCtrl.text, 
                          harga: harga
                        ));
                        namaCtrl.clear();
                        hargaCtrl.clear();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Cetak Struk", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listProduk.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.event_note_rounded),
                      title: Text(listProduk[index].nama,style: TextStyle(fontWeight: FontWeight.bold),),
                      // subtitle: Text(listCatatan[index].isi),
                    );
              }))
            ],
          ),
        ),
      ),
    );
  }
}

// class untuk menampilkan list produk
class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Produk.dummyData.length,
      itemBuilder: (context, index) {
        final produk = Produk.dummyData[index];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            color: Color(0xFFF7F3FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              title: Text(
                produk.nama,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                produk.harga.toString(),
                style: TextStyle(color: Colors.grey),
              ),
              trailing: SizedBox(
                width: 50,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

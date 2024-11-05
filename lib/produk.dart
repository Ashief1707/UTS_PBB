class Produk{
  String nama;
  int harga;

  Produk({
    required this.nama,
    required this.harga,
  });

  static List<Produk> dummyData = [
    Produk(nama: "Laptop", harga: 25000000),
    Produk(nama: "Mouse", harga: 1250000),
    Produk(nama: "Keyboard", harga: 1500000),
    Produk(nama: "Monitor", harga: 5000000),
    Produk(nama: "Printer", harga: 2200000),
  ];

}
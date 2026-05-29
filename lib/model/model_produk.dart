class ModelProduk {
  final int id;
  final String nama;
  final String? gambar;
  final double harga;
  final String? kategori;

  ModelProduk({
    required this.id,
    required this.nama,
    this.gambar,
    required this.harga,
    this.kategori,
  });

  factory ModelProduk.fromJson(Map<String, dynamic> json) {
    return ModelProduk(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      gambar: json['gambar'],
      harga: (json['harga'] ?? 0).toDouble(),
      kategori: json['kategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'gambar': gambar,
      'harga': harga,
      'kategori': kategori,
    };
  }
}

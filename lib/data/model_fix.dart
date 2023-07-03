class PartnerKu {
  String? nama;
  String? lokasi;
  String? kategori;
  String? about;
  String? harga;
  String? logo;
  String? createdAt;
  List<String>? foto;

  PartnerKu(
      {this.nama,
      this.lokasi,
      this.kategori,
      this.about,
      this.harga,
      this.logo,
      this.createdAt,
      this.foto});

  PartnerKu.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    lokasi = json['lokasi'];
    kategori = json['kategori'];
    about = json['about'];
    harga = json['harga'];
    logo = json['logo'];
    createdAt = json['createdAt'];
    foto = json['foto'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['lokasi'] = this.lokasi;
    data['kategori'] = this.kategori;
    data['about'] = this.about;
    data['harga'] = this.harga;
    data['logo'] = this.logo;
    data['createdAt'] = this.createdAt;
    data['foto'] = this.foto;
    return data;
  }
}

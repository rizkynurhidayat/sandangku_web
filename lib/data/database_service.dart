import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sandangku_web/data/model_fix.dart';

class DatabaseKu {
  final db = FirebaseFirestore.instance;

  // Future<List<PartnerKu>> getData({String kategori = "All"}) async {
  //   if (kategori == "Event Organizer") {
  //     print("get EO");
  //     return await getEOData();
  //   } else if (kategori == "Venue") {
  //     print("get Venue");
  //     return await getVenueData();
  //   } else if (kategori == "Vendor") {
  //     print("get Vendor");
  //     return await getVendorData();
  //   }
  //   print("get All");
  //   return await getAllData();
  // }

  Future<List<PartnerKu>> getAllData() async {
    final data = await db.collection('partner').get();
    final respon =
        await data.docs.map((e) => PartnerKu.fromJson(e.data())).toList();
    return respon;
  }

  Future<List<PartnerKu>> getEOData() async {
    final data = await db
        .collection('partner')
        .where("kategori", isEqualTo: "Event Organizer")
        .get();
    final respon =
        await data.docs.map((e) => PartnerKu.fromJson(e.data())).toList();
    return respon;
  }

  Future<List<PartnerKu>> getVenueData() async {
    final data = await db
        .collection('partner')
        .where("kategori", isEqualTo: "Venue")
        .get();
    final respon =
        await data.docs.map((e) => PartnerKu.fromJson(e.data())).toList();
    return respon;
  }

  Future<List<PartnerKu>> getVendorData() async {
    final data = await db
        .collection('partner')
        .where("kategori", isEqualTo: "Vendor")
        .get();
    final respon =
        await data.docs.map((e) => PartnerKu.fromJson(e.data())).toList();
    return respon;
  }

  Future<PartnerKu> getDatabyId(String id) async {
    final data = await db.collection('partner').doc(id).get();
    final respon = PartnerKu.fromJson(data.data()!);

    return respon;
  }

  Future<void> addData(
      {required String nama,
      required String about,
      required String harga,
      required String logo,
      required String lokasi,
      required String kategori,
      required List<String> foto}) async {
    final now = DateTime.now().toIso8601String();
    await db.collection('partner').doc(nama).set(PartnerKu(
            about: about,
            createdAt: now,
            foto: foto,
            harga: harga,
            kategori: kategori,
            logo: logo,
            lokasi: lokasi,
            nama: nama)
        .toJson());
  }

  // Future<void> updateData(
  //     {required String nama,
  //     required String about,
  //     required String harga,
  //     required String logo,
  //     required String lokasi,
  //     required String kategori,
  //     required List<String> foto}) async {
  //   await db.collection('partner').doc(nama).update({
  //     "nama": (nama != null) ? nama : null,
  //     "lokasi": (lokasi != null) ? lokasi : null,
  //     "harga": (harga != null) ? harga : null,
  //     "logo": (logo != null) ? logo : null,
  //     "about": (about != null) ? about : null,
  //     "kategori": (kategori != null) ? kategori : null,
  //     "foto": (foto != null) ? foto : null,
  //   });
  // }
}

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/controller/home_controller.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sandangku_web/data/fileFoto.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sandangku_web/presentation/pages/check_view.dart';

import '../data/database_service.dart';
import '../data/model_fix.dart';

class FirebaseController extends HomeController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = DatabaseKu();

  void signUp() async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      user = result.user;

      print(user!.email);
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        title: "SUCSESS",
        message: "Selamat Anda Sudah Terdaftar",
      ));
      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.off(CheckView());
        },
      );
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.colorScheme.error,
        duration: const Duration(seconds: 2),
        title: "ERROR",
        message: e.message,
      ));

      print(e);
    }

    // return user;
  }

  void logOut() async {
    user = null;
    await _auth.signOut();
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Get.theme.colorScheme.error,
      duration: const Duration(seconds: 2),
      title: "LOG OUT",
      message: "anda sudah log out",
    ));

    Get.offAll(CheckView());
  }

  void signIn() async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      user = result.user;

      print(user!.email);
      Get.off(CheckView());
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.colorScheme.error,
        duration: const Duration(seconds: 2),
        title: "ERROR",
        message: e.message,
      ));
      print(e);
    }
  }

  void addData() async {
    await db.addData(
        nama: namaPartner.text,
        about: aboutPartner.text,
        harga: hargaPartner.text,
        logo: "partner/${namaPartner.text}/${logo.value.name}",
        lokasi: lokasiPartner.text,
        kategori: kategoriPartner.text,
        foto: listFoto.map((e) => e.name!).toList());

    // Get.showSnackbar(GetSnackBar(
    //   backgroundColor: Colors.green,
    //   duration: Duration(seconds: 3),
    //   message: "Berhasil Menambahkan Data Partner",
    // ));

    // list.clear();
  }

  void addLogo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    String fileName = result!.files.first.name;
    var fileBytes = result.files.first.bytes;
    logo.value = fileFoto(name: fileName, bytes: fileBytes);

    // print(logo.value.name! + " | " + logo.value.bytes.toString());

    // print(logo.value);
  }

  void addListFoto() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    var fileName = result!.files.map((e) => e.name).toList();
    var fileBytes = result.files.map((e) => e.bytes).toList();

    for (int i = 0; i <= fileName.length; i++) {
      String nama = fileName[i];
      var byte = fileBytes[i];
      listFoto.add(fileFoto(name: nama, bytes: byte));
      // listFoto.forEach((element) {
      //   print(element.name);
      //   print(element.bytes);
      // });
    }
  }

  Future<void> uploadAll(Uint8List bytes, String ref) async {
    await FirebaseStorage.instance.ref('partner/$ref').putData(bytes);

    // Get.showSnackbar(GetSnackBar(
    //   duration: Duration(seconds: 2),
    //   message: "Sukses",
    //   backgroundColor: Colors.green,
    // ));
  }
  // void tambahfoto() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     Uint8List fileBytes = result.files.first.bytes!;
  //     String fileName = result.files.first.name;
  //     namafile.value = fileName;
  //     bytefile = fileBytes;

  //     // Upload file
  //     await FirebaseStorage.instance
  //         .ref('partner/${namaPartner.text}/${namafile.value}')
  //         .putData(bytefile);
  //   }
  //   Get.showSnackbar(GetSnackBar(
  //     duration: Duration(seconds: 2),
  //     message: "Sukses",
  //     backgroundColor: Colors.green,
  //   ));
  // }

  var imgUrl = "".obs;
  Future<String> lihatfoto(String ref) async {
    // try {
    final data =
        await FirebaseStorage.instance.ref('partner/$ref').getDownloadURL();
    debugPrint(data);
    return data;
  }

  Future<List<String>> lihatAllfoto(PartnerKu partner) async {
    var data = <String>[];

    partner.foto!.forEach(
      (element) async {
        var link = await lihatfoto("${partner.nama}/$element");
        data.add(link);
        print("jumlah ${listFoto.length}");
      },
    );
    print(data[0] + "data ke 1");
    return data;
  }
}

// import 'dart:convert';
// import 'dart:io';

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../data/fileFoto.dart';
// import '../data/model_fix.dart';

class HomeController extends GetxController {
  TextEditingController namaAcara = TextEditingController();
  TextEditingController lokasiAcara = TextEditingController();
  TextEditingController kapasitasAcara = TextEditingController();
  TextEditingController catatanAcara = TextEditingController();
  TextEditingController jenisAcara = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //partner
  TextEditingController namaPartner = TextEditingController();
  TextEditingController kategoriPartner = TextEditingController();
  TextEditingController lokasiPartner = TextEditingController();
  TextEditingController hargaPartner = TextEditingController();
  // TextEditingController logoPartner = TextEditingController();
  TextEditingController aboutPartner = TextEditingController();
  TextEditingController fotoPartner = TextEditingController();
  // var listFileFoto = <String>["kosong"].obs;
  // var listFileBytes = <Uint8List?>[].obs;
  // var logo = "logo".obs;
  // Uint8List? logoBytes;
  ScrollController scrollc = ScrollController();
  var logo = fileFoto(name: "Logo").obs;
  var listFoto = <fileFoto>[].obs;

  String jenis = '';
  var namafile = ''.obs;
  late Uint8List bytefile;
  String whatsappUrl = "whatsapp://send?phone=+6285782502350";
  var tempatIndex = 0.obs;
  var jumlahIndex = 0.obs;
  var ktgrIndex = 3.obs;
  var ktgrIndexHome = 0.obs;
  var ktgrHomeChoice = 'All'.obs;

  var isSelect = false.obs;
  var door = ''.obs;
  var isHome = false.obs;
  var sIndex = 0.obs;
  var jmlfotoPartner = 0.obs;
  User? user;

  final ktgr = ["Event Organizer", "Venue", "Vendor", ""];
  final ktgrHome = ["All", "Event Organizer", "Venue", "Vendor"];

  void openUrl() async {
    var url = Uri.parse(
        "$whatsappUrl&text= |======== $jenis ========|%0a Halo Saya ingin membuat acara bernama ${namaAcara.text}%0a dengan kapasitas ${kapasitasAcara.text} orang, ${door.value}%0a alamat : ${lokasiAcara.text}");
    try {
      await launchUrl(
        url,
      );

      print(url.toString());
    } catch (e) {
      //To handle error and display error message
      Get.showSnackbar(GetSnackBar(
        message: "Can not open whatsapp",
        title: "Error !!!",
        backgroundColor: Colors.red.shade200,
      ));
    }
  }

  void openlink(String url) async {
    await launchUrl(
      Uri.parse(url),
    );
  }

  void contact() async {
    var url = Uri.parse("https://wa.me/6285782502350");
    try {
      await launchUrl(
        url,
      );

      print(url.toString());
    } catch (e) {
      //To handle error and display error message

      Get.showSnackbar(GetSnackBar(
        message: "Can not open whatsapp",
        title: "Error !!!",
        backgroundColor: Colors.red.shade200,
      ));
    }
  }

  // Widget execute({required double width}) {
  //   if (width <= 400) {
  //     if (sIndex.value == 0) {
  //       return const HomeMobilePage();
  //     } else if (sIndex.value == 1) {
  //       return const MyOrderPage();
  //     } else if (sIndex.value == 2) {
  //       return const PortofolioPage();
  //     } else if (sIndex.value == 3) {
  //       return const AboutPage();
  //     } else if (sIndex.value == 4) {
  //       return const ContactPage();
  //     }
  //   } else if (width > 400) {
  //     if (sIndex.value == 0) {
  //       return const HomePage();
  //     } else if (sIndex.value == 1) {
  //       return const MyOrderPage();
  //     } else if (sIndex.value == 2) {
  //       return const PortofolioPage();
  //     } else if (sIndex.value == 3) {
  //       return const AboutPage();
  //     } else if (sIndex.value == 4) {
  //       return const ContactPage();
  //     }
  //   }
  //   return const SizedBox();
  // }
}

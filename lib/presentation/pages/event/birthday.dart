import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/controller/database_controller.dart';

import '../../widget/itemChoice.dart';

class Birthday extends StatelessWidget {
  const Birthday({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return Scaffold(
      backgroundColor: context.theme.colorScheme.primaryContainer,
      body: Center(
        child: Card(
            child: Container(
          padding: const EdgeInsets.all(20),
          width: 340,
          height: Get.height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Registration',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: c.namaAcara,
                decoration: InputDecoration(
                    hintText: "Apa Nama Acaramu ?",
                    labelText: "Nama Acara",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              Wrap(
                  spacing: 10,
                  children: listTempat
                      .map((e) => Obx(
                            () => ChoiceChip(
                              label: Text(e.label),
                              selected: c.tempatIndex.value == e.id,
                              onSelected: (value) {
                                c.tempatIndex.value = e.id;
                                c.door.value = e.label;
                              },
                            ),
                          ))
                      .toList()),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Kapasitas Orang")),
              Wrap(
                  spacing: 10,
                  children: listJumlah
                      .map((e) => Obx(
                            () => ChoiceChip(
                              label: Text(e.label),
                              selected: c.jumlahIndex.value == e.id,
                              onSelected: (value) {
                                c.jumlahIndex.value = e.id;
                                c.isSelect.value = false;
                                c.kapasitasAcara.text = e.label;

                                if (c.jumlahIndex.value == 4) {
                                  c.kapasitasAcara.text = "";
                                  c.isSelect.value = true;
                                }
                              },
                            ),
                          ))
                      .toList()),
              Obx(
                () => TextField(
                  enabled: (c.isSelect.isTrue) ? true : false,
                  controller: c.kapasitasAcara,
                  decoration: InputDecoration(
                      hintText: "Berapa jumlah kapasitas orangnya ?",
                      labelText: "kapasitas Orang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Obx(
                () => TextField(
                  controller: c.lokasiAcara,
                  decoration: InputDecoration(
                      hintText: (c.tempatIndex.value == 1)
                          ? "Hotel, Resto, Rumah, dll"
                          : "Pantai, Taman, Halaman Rumah, dll",
                      labelText: "Lokasi Acara",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              context.theme.colorScheme.onSecondaryContainer),
                          backgroundColor: MaterialStatePropertyAll(
                              context.theme.colorScheme.secondaryContainer)),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("back")),
                  ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              context.theme.colorScheme.onPrimary),
                          backgroundColor: MaterialStatePropertyAll(
                              context.theme.colorScheme.primary)),
                      onPressed: () {
                        c.jenis = "BirthDay";
                        c.openUrl();
                        c.kapasitasAcara.clear();
                        c.lokasiAcara.clear();
                        c.namaAcara.clear();
                      },
                      child: const Text("Oreder Now"))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}

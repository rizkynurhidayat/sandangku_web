import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/controller/database_controller.dart';

class AddPartner extends StatelessWidget {
  const AddPartner({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());

    return Scaffold(
      backgroundColor: context.theme.colorScheme.secondaryContainer,
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 360,
              height: 900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'REGISTER AS PARTNER',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    controller: c.namaPartner,
                    decoration: InputDecoration(
                        hintText: "Input Nama Perusahaan",
                        labelText: "Nama Partner",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  TextField(
                    controller: c.aboutPartner,
                    decoration: InputDecoration(
                        hintText: "Deskripsikan perusahaan anda",
                        labelText: "About Partner",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  Text(
                    "Kategori",
                  ),
                  Container(
                      child: Wrap(
                          children: List.generate(
                              c.ktgr.length - 1,
                              (index) => Obx(() => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ChoiceChip(
                                      label: Text(c.ktgr[index]),
                                      selected: c.ktgrIndex.value == index,
                                      onSelected: (value) {
                                        c.ktgrIndex.value = index;
                                        c.kategoriPartner.text = c.ktgr[index];
                                        print(c.kategoriPartner.text);
                                      },
                                    ),
                                  ))))),
                  TextField(
                    controller: c.lokasiPartner,
                    decoration: InputDecoration(
                        hintText: "jl ....",
                        labelText: "Lokasi Partner",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Obx(
                          () => TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: c.logo.value.name,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: ElevatedButton(
                              onPressed: () {
                                c.addLogo();
                              },
                              child: Text("+")))
                    ],
                  ),
                  TextField(
                    controller: c.hargaPartner,
                    decoration: InputDecoration(
                        hintText: "Rp xxx - Rp xxxx",
                        labelText: "Range Harga Partner",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        c.addListFoto();
                      },
                      child: Text("tambah foto")),
                  Container(
                      height: 200,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: c.listFoto.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(c.listFoto[index].name!),
                            trailing: IconButton(
                                onPressed: () {
                                  c.listFoto.removeAt(index);
                                },
                                icon: Icon(Icons.remove_circle_outline)),
                          ),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(context
                                  .theme.colorScheme.onSecondaryContainer),
                              backgroundColor: MaterialStatePropertyAll(context
                                  .theme.colorScheme.secondaryContainer)),
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
                          onPressed: () async {
                            // add data to firebase
                            try {
                              c.addData();
                            } catch (e) {
                              print(e);
                            }

                            //upload logo
                            try {
                              await c.uploadAll(c.logo.value.bytes!,
                                  "${c.namaPartner.text}/${c.logo.value.name}");
                              Get.showSnackbar(GetSnackBar(
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 3),
                                message: "Berhasil Menambahkan Logo Partner",
                              ));
                            } catch (e) {
                              print(e);
                            }
                            //upload file foto
                            try {
                              for (int i = 0; i <= c.listFoto.length; i++) {
                                await c.uploadAll(c.listFoto[i].bytes!,
                                    "${c.namaPartner.text}/${c.listFoto[i].name}");
                                Get.showSnackbar(GetSnackBar(
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 3),
                                  message:
                                      "Berhasil upload foto ${i + 1} Partner",
                                ));
                              }
                            } catch (e) {
                              print(e);
                            }
                            c.namaPartner.clear();
                            c.hargaPartner.clear();
                            c.lokasiPartner.clear();
                            c.kategoriPartner.clear();
                            c.ktgrIndex.value = 4;

                            Get.showSnackbar(GetSnackBar(
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 3),
                              message: "Berhasil Menambahkan Data Partner",
                            ));
                          },
                          child: const Text("Add Partner"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

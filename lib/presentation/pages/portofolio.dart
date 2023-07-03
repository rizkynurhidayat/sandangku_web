import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/controller/database_controller.dart';
import '../../data/model_fix.dart';
import '../../data/model_partner.dart';

// ignore: must_be_immutable
class PortofolioPage extends StatelessWidget {
  PortofolioPage({super.key, required this.partner});

  PartnerKu partner;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());

    return Scaffold(
      appBar: AppBar(
        title: Text(partner.nama!),
        backgroundColor: context.theme.colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: ListView(children: [
          SizedBox(
            height: 500,
            child: Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.amber)),
                      margin: EdgeInsets.all(10),
                      child: FutureBuilder<String>(
                        future:
                            c.lihatfoto("${partner.nama}/${partner.foto![0]}"),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final data = snapshot.data!;
                            return Image.network(data, fit: BoxFit.fill);
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    )),
                Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: FutureBuilder<String>(
                              future: c.lihatfoto(
                                  "${partner.nama}/${partner.foto![1]}"),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final data = snapshot.data!;
                                  return Image.network(data, fit: BoxFit.fill);
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: FutureBuilder<String>(
                                    future: c.lihatfoto(
                                        "${partner.nama}/${partner.foto![2]}"),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final data = snapshot.data!;
                                        return Image.network(data,
                                            fit: BoxFit.fill);
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Center(
                                child: ElevatedButton(
                                    onPressed: () {}, child: Text("See more")),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: 500,
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.info_outline),
                          title: const Text(
                            "About",
                            style: TextStyle(fontSize: 28),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(partner.nama!.capitalize!),
                              Text(partner.about!),
                              // Text(
                              //     "Bidang Usaha: ${partner.} | ${partner.bidangUsaha[1]}"),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.instagram)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.language)),
                            IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.facebook))
                          ],
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: const Text(
                            "Location",
                            style: TextStyle(fontSize: 28),
                          ),
                          subtitle: Text("Alamat: ${partner.lokasi}"),
                        ),
                        ListTile(
                          title: Text(
                            "Start from ${partner.harga}",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 24),
                          ),
                        ),
                      ],
                    )),
                Flexible(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                            child: FaIcon(
                          FontAwesomeIcons.shop,
                          size: 48,
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Chip(label: Text(partner.kategori!)),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            c.contact();
                          },
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(300, 70)),
                              backgroundColor: MaterialStatePropertyAll(
                                  context.theme.colorScheme.primaryContainer)),
                          icon: const Icon(Icons.bookmark_add),
                          label: const Text("book Now")),
                    ],
                  ),
                )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class PortofolioMobile extends StatelessWidget {
  PortofolioMobile({super.key, required this.partner});
  Partner partner;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return Scaffold(
      appBar: AppBar(
        title: Text(partner.nama),
        backgroundColor: context.theme.colorScheme.primaryContainer,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                partner.listFoto[0],
                fit: BoxFit.fill,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 300,
                    child: Image.asset(
                      partner.listFoto[1],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          height: 300,
                          child: Image.asset(
                            partner.listFoto[1],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("see more")),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text(
                "About",
                style: TextStyle(fontSize: 28),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(partner.nama.capitalize!),
                  Text(partner.about),
                  Text(
                      "Bidang Usaha: ${partner.bidangUsaha[0]} | ${partner.bidangUsaha[1]}"),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.instagram)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.language)),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.facebook))
              ],
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text(
                "Location",
                style: TextStyle(fontSize: 28),
              ),
              subtitle: Text("Alamat: ${partner.alamat}"),
            ),
            ListTile(
              title: Text(
                "Start from ${partner.harga}",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: FaIcon(
                      FontAwesomeIcons.shop,
                      size: 48,
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Chip(label: Text(partner.kategori)),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        c.contact();
                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(300, 70)),
                          backgroundColor: MaterialStatePropertyAll(
                              context.theme.colorScheme.primaryContainer)),
                      icon: const Icon(Icons.bookmark_add),
                      label: const Text("book Now")),
                ],
              ),
            )),
          ],
        ),
      )),
    );
  }
}

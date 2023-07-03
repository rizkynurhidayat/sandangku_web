import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sandangku_web/controller/database_controller.dart';
import 'package:sandangku_web/data/model_fix.dart';

import 'package:sandangku_web/presentation/pages/about.dart';
import 'package:sandangku_web/presentation/pages/base.dart';

import 'package:sandangku_web/presentation/pages/portofolio.dart';

import '../widget/partner.dart';
// import '../../data/model_partner.dart';
import 'footer.dart';
import 'ourservice.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      page: const IsiHomePage(),
    );
  }
}

class IsiHomePage extends StatelessWidget {
  const IsiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());

    return Scaffold(
      body: SafeArea(
        child: ListView(controller: c.scrollc, children: [
          SizedBox(
              width: 900, height: 400, child: Image.asset("assets/banner.png")),
          const SizedBox(
            height: 30,
          ),
          const OurService(),
          const AboutPage(),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text("Our Partner"),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: List.generate(
                c.ktgrHome.length,
                (index) => Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChoiceChip(
                        label: Text(c.ktgrHome[index]),
                        selected: c.ktgrIndexHome.value == index,
                        onSelected: (value) {
                          c.ktgrIndexHome.value = index;
                          c.ktgrHomeChoice.value = c.ktgrHome[index];
                          print(c.ktgrHomeChoice.value);
                        },
                      ),
                    ))),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(() {
            if (c.ktgrHomeChoice.value == "Event Organizer") {
              return EoPartner();
            } else if (c.ktgrHomeChoice.value == "Venue") {
              return VenuePartner();
            } else if (c.ktgrHomeChoice.value == "Vendor") {
              return VendorPartner();
            } else {
              return AllPartner();
            }
          }),

          // Wrap(spacing: 10, alignment: WrapAlignment.center, children: [
          //   OurPartner(
          //     image: partner1.logo,
          //     partner: partner1.nama.capitalize!,
          //     ontap: () {
          //       Get.to(PortofolioPage(
          //         partner: partner1,
          //       ));
          //     },
          //   ),
          //   OurPartner(
          //     image: "Brizola",
          //     partner: partner2.nama.capitalize!,
          //     ontap: () {
          //       Get.to(PortofolioPage(
          //         partner: partner2,
          //       ));
          //     },
          //   ),
          //   OurPartner(
          //     image: "Viding.co",
          //     partner: partner3.nama.capitalize!,
          //     ontap: () {
          //       Get.to(PortofolioPage(
          //         partner: partner3,
          //       ));
          //     },
          //   ),
          //   OurPartner(
          //     image: partner4.logo,
          //     partner: partner4.nama.capitalize!,
          //     ontap: () {
          //       Get.to(PortofolioPage(
          //         partner: partner4,
          //       ));
          //     },
          //   ),
          //   OurPartner(
          //     image: partner5.logo,
          //     partner: partner5.nama.capitalize!,
          //     ontap: () {
          //       Get.to(PortofolioPage(
          //         partner: partner5,
          //       ));
          //     },
          //   ),
          //   OurPartner(
          //     ontap: () {},
          //   ),
          // ]),
          Footer(),
        ]),
      ),
    );
  }
}

class AllPartner extends StatelessWidget {
  const AllPartner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return FutureBuilder<List<PartnerKu>>(
      future: c.db.getAllData(),
      builder: (context, snapshot) {
        final data = snapshot.data!;

        if (snapshot.hasData) {
          return Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: List.generate(
                data.length,
                (index) => FutureBuilder(
                      future: c.lihatfoto(
                          "${data[index].nama}/${data[index].logo!}"),
                      builder: (context, snapshot) {
                        final logo = snapshot.data;

                        if (snapshot.hasData) {
                          return OurPartner(
                            image: logo,
                            partner: data[index].nama,
                            ontap: () {
                              Get.to(PortofolioPage(partner: data[index]));
                            },
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    )),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class EoPartner extends StatelessWidget {
  const EoPartner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return FutureBuilder<List<PartnerKu>>(
      future: c.db.getEOData(),
      builder: (context, snapshot) {
        final data = snapshot.data!;

        if (snapshot.hasData) {
          return Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: List.generate(
                data.length,
                (index) => FutureBuilder(
                      future: c.lihatfoto(
                          "${data[index].nama}/${data[index].logo!}"),
                      builder: (context, snapshot) {
                        final logo = snapshot.data;

                        if (snapshot.hasData) {
                          return OurPartner(
                            image: logo,
                            partner: data[index].nama,
                            ontap: () {
                              Get.to(PortofolioPage(partner: data[index]));
                            },
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    )),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class VendorPartner extends StatelessWidget {
  const VendorPartner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return FutureBuilder<List<PartnerKu>>(
      future: c.db.getVendorData(),
      builder: (context, snapshot) {
        final data = snapshot.data!;

        if (snapshot.hasData) {
          return Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: List.generate(
                data.length,
                (index) => FutureBuilder(
                      future: c.lihatfoto(
                          "${data[index].nama}/${data[index].logo!}"),
                      builder: (context, snapshot) {
                        final logo = snapshot.data;

                        if (snapshot.hasData) {
                          return OurPartner(
                            image: logo,
                            partner: data[index].nama,
                            ontap: () {
                              Get.to(PortofolioPage(partner: data[index]));
                            },
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    )),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class VenuePartner extends StatelessWidget {
  const VenuePartner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return FutureBuilder<List<PartnerKu>>(
      future: c.db.getVenueData(),
      builder: (context, snapshot) {
        final data = snapshot.data!;

        if (snapshot.hasData) {
          return Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: List.generate(
                data.length,
                (index) => FutureBuilder(
                      future: c.lihatfoto(
                          "${data[index].nama}/${data[index].logo!}"),
                      builder: (context, snapshot) {
                        final logo = snapshot.data;

                        if (snapshot.hasData) {
                          return OurPartner(
                            image: logo,
                            partner: data[index].nama,
                            ontap: () {
                              Get.to(PortofolioPage(partner: data[index]));
                            },
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    )),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

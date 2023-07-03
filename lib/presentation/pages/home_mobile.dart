import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/controller/database_controller.dart';
import 'package:sandangku_web/presentation/pages/about.dart';
import 'package:sandangku_web/presentation/pages/base_mobile.dart';
import 'package:sandangku_web/presentation/pages/footer.dart';
import 'package:sandangku_web/presentation/pages/portofolio.dart';

import '../widget/orderContainer.dart';
import '../widget/partner.dart';
import 'event/birthday.dart';
import 'event/mice.dart';
import 'event/other.dart';
import 'event/wedding.dart';
import 'login.dart';
import '../../data/model_partner.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseMobilePage(page: IsiHomePageMobile());
  }
}

class IsiHomePageMobile extends StatelessWidget {
  const IsiHomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    final orders = ["MICE", "BirthDay", "Wedding", "Other"];
    final foto = [
      "assets/event/6.jpeg",
      "assets/event/2.jpeg",
      "assets/event/9.jpeg",
      "assets/event/13.jpeg",
    ];
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SizedBox(
              width: Get.width,
              height: 200,
              child: Image.asset("assets/banner.png")),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text("Our Service"),
          ),
          const SizedBox(
            height: 30,
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: List.generate(
                4,
                (index) => orderContainer(
                      linkphoto: foto[index],
                      page: orders[index],
                      onTap: () {
                        if (c.user == null) {
                          Get.to(LoginPage());
                        } else {
                          switch (index) {
                            case 0:
                              {
                                Get.to(const Micu());
                              }
                              break;
                            case 1:
                              {
                                Get.to(const Birthday());
                              }
                              break;
                            case 2:
                              {
                                Get.to(const Wedding());
                              }
                              break;
                            case 3:
                              {
                                Get.to(const Other());
                              }
                              break;
                          }
                        }
                      },
                    )),
          ),
          const SizedBox(
            height: 30,
          ),
          AboutPage(),
          const Center(
            child: Text("Our Partner"),
          ),
          const SizedBox(
            height: 30,
          ),
          Wrap(
              spacing: 10,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                OurPartner(
                  image: partner1.logo,
                  partner: partner1.nama.capitalize!,
                  ontap: () {
                    Get.to(PortofolioMobile(partner: partner1));
                  },
                ),
                OurPartner(
                  image: partner2.logo,
                  partner: partner2.nama.capitalize!,
                  ontap: () {
                    Get.to(PortofolioMobile(partner: partner2));
                  },
                ),
                OurPartner(
                  image: partner3.logo,
                  partner: partner3.nama.capitalize!,
                  ontap: () {
                    Get.to(PortofolioMobile(partner: partner3));
                  },
                ),
                OurPartner(
                  image: partner4.logo,
                  partner: partner4.nama.capitalize!,
                  ontap: () {
                    Get.to(PortofolioMobile(partner: partner4));
                  },
                ),
                OurPartner(
                  image: partner5.logo,
                  partner: partner5.nama.capitalize!,
                  ontap: () {
                    Get.to(PortofolioMobile(partner: partner5));
                  },
                ),
                OurPartner(
                  ontap: () {},
                )
              ]),
          FooterMobile()
        ],
      ),
    );
  }
}

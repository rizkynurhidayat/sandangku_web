import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import '../../controller/database_controller.dart';
import '../widget/orderContainer.dart';
import 'event/birthday.dart';
import 'event/mice.dart';
import 'event/other.dart';
import 'event/wedding.dart';

class OurService extends StatelessWidget {
  const OurService({super.key});

  @override
  Widget build(BuildContext context) {
    // final c = Get.put(FirebaseController());
    final orders = ["MICE", "BirthDay", "Wedding", "Other"];
    final foto = [
      "assets/event/6.jpeg",
      "assets/event/2.jpeg",
      "assets/event/9.jpeg",
      "assets/event/13.jpeg",
    ];

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          const Center(
            child: Text("Our Service"),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                4,
                (index) => orderContainer(
                      linkphoto: foto[index],
                      page: orders[index],
                      onTap: () {
                        // if (c.user == null) {
                        //   Get.to(LoginPage());
                        // } else {
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
                        // }
                      },
                    )),
          ),
        ],
      ),
    );
  }
}

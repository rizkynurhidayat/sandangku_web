// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/controller/database_controller.dart';
import 'package:sandangku_web/presentation/pages/add_partner.dart';
import 'package:sandangku_web/presentation/pages/home_mobile.dart';
import 'package:sandangku_web/presentation/pages/login.dart';
// import 'package:sandangku_web/presentation/pages/myorder.dart';

// import '../../controller/home_controller.dart';

// ignore: must_be_immutable
class BaseMobilePage extends StatelessWidget {
  BaseMobilePage({super.key, required this.page});
  Widget page;
  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return Scaffold(
        endDrawer: Drawer(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                height: 70,
                child: Image.asset("assets/Logo3.png"),
              ),
              const Divider(),
              TextButton(
                  onPressed: () {
                    Get.off(const HomePageMobile());
                  },
                  child: const Text("Home")),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const AddPartner());
                  },
                  child: const Text("Add Partner")),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    c.contact();
                  },
                  child: const Text("Contact Us")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1),
                  ),
                  onPressed: () {
                    if (c.user == null) {
                      Get.to(const LoginPage());
                    } else {
                      Get.defaultDialog(
                        title: "LOG OUT",
                        middleText: "anda akan keluar dari akun",
                        onCancel: () => Get.back(),
                        onConfirm: () {
                          c.logOut();
                        },
                      );
                    }
                  },
                  icon: const Icon(Icons.person),
                  label: Text(
                      overflow: TextOverflow.ellipsis,
                      (c.user == null) ? "Login" : c.user!.email!)),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset("assets/Logo3.png"),
          ),
          title: Text("Ventra.Id"),
          backgroundColor: context.theme.colorScheme.primaryContainer,
        ),
        body: page);
  }
}

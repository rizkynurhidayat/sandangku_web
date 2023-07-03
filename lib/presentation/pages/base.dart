import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/controller/database_controller.dart';
import 'package:sandangku_web/presentation/pages/add_partner.dart';
import 'package:sandangku_web/presentation/pages/home.dart';

// import 'footer.dart';
import 'login.dart';

// ignore: must_be_immutable
class BasePage extends StatelessWidget {
  BasePage({super.key, required this.page});
  Widget page;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset("assets/Logo3.png"),
        ),
        title: const Text("Ventra.Id"),
        backgroundColor: context.theme.colorScheme.primaryContainer,
        actions: [
          TextButton(
              onPressed: () async {
                await c.scrollc.animateTo(c.scrollc.position.minScrollExtent,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
              child: const Text("Home")),
          const SizedBox(
            width: 20,
          ),
          TextButton(
              onPressed: () async {
                print("servic " +
                    (c.scrollc.position.minScrollExtent + 300).toString());
                await c.scrollc.animateTo(
                    c.scrollc.position.minScrollExtent + 300,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
              child: const Text("Our Service")),
          const SizedBox(
            width: 20,
          ),
          TextButton(
              onPressed: () async {
                final abot = c.scrollc.position.maxScrollExtent - 600;
                print("about " + abot.toString());
                await c.scrollc.animateTo(729,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
              child: const Text("About Us")),
          const SizedBox(
            width: 20,
          ),
          TextButton(
              onPressed: () async {
                await c.scrollc.animateTo(1279,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
              child: const Text("Our Partner")),
          const SizedBox(
            width: 20,
          ),
          TextButton(
              onPressed: () {
                c.contact();
              },
              child: const Text("Contact Us")),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(const AddPartner());
              },
              child: const Text("Join Us")),
          const SizedBox(
            width: 20,
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
            width: 20,
          ),
        ],
      ),
      body: page,
    );
  }
}

class AppBarKu extends StatelessWidget {
  AppBarKu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset("assets/Logo2.png"),
        ),
        TextButton(
            onPressed: () {
              Get.off(const HomePage());
            },
            child: const Text("Home")),
        const SizedBox(
          width: 20,
        ),
        TextButton(
            onPressed: () {
              Get.to(const AddPartner());
            },
            child: const Text("Add Partner")),
        const SizedBox(
          width: 20,
        ),
        TextButton(
            onPressed: () {
              c.contact();
            },
            child: const Text("Contact Us")),
        const SizedBox(
          width: 20,
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
          width: 20,
        ),
      ],
    );
  }
}

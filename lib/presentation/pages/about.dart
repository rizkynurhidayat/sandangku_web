import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/constant.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: (Get.width > 400)
          ? Column(
              children: [
                const Text("About Us"),
                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text("$description\n\n$description2\n\n$visi"),
                        )),
                    Flexible(
                        child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(100),
                      child: Image.asset("assets/Logo2.png"),
                    ))
                  ],
                )
              ],
            )
          : Column(
              children: [
                const Text("About Us"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Text(
                    "$description\n\n$description2\n\n$visi",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(100),
                  child: Image.asset(
                    "assets/Logo2.png",
                  ),
                )
              ],
            ),
    );
  }
}

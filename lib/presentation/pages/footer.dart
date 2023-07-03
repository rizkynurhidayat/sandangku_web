import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/Logo2.png",
                  width: 110,
                  height: 110,
                ),
                Text("Ventra.Id"),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.instagram)),
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.facebook)),
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.whatsapp)),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Office ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onPrimaryContainer),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on),
                    label: const Text("alamat ventra id")),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone),
                    label: const Text("085782502350")),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.mail),
                    label: const Text("ventra.id@gmail.com")),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Link ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onPrimaryContainer),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(onPressed: () {}, child: const Text("About")),
                const SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: () {}, child: const Text("My Order")),
                const SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: () {}, child: const Text("Contact Us")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/Logo2.png",
                  width: 110,
                  height: 110,
                ),
                Text("Ventra.Id"),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.instagram)),
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.facebook)),
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.whatsapp)),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Office ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onPrimaryContainer),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on),
                    label: const Text("alamat ventra id")),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone),
                    label: const Text("085782502350")),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.mail),
                    label: const Text("ventra.id@gmail.com")),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Link ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onPrimaryContainer),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(onPressed: () {}, child: const Text("About")),
                const SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: () {}, child: const Text("My Order")),
                const SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: () {}, child: const Text("Contact Us")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

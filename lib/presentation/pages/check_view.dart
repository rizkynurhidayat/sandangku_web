import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/presentation/pages/home.dart';
import 'package:sandangku_web/presentation/pages/home_mobile.dart';

// ignore: must_be_immutable
class CheckView extends StatelessWidget {
  CheckView({super.key, this.akun});
  User? akun;

  @override
  Widget build(BuildContext context) {
    return (context.width <= 400) ? const HomePageMobile() : const HomePage();
  }
}
